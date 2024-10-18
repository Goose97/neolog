---@class NeologActions
--- @field log_templates NeologLogTemplates
local M = {}

local utils = require("neolog.utils")

--- Build the log label from template. Support special placeholers:
---   %identifier: the identifier text
---   %fn_name: the enclosing function name. If there's none, replaces with empty string
---   %line_number: the line_number number
---@param label_template string
---@param log_target_node TSNode
---@return string
local function build_log_label(label_template, log_target_node)
  local label = label_template

  if string.find(label, "%%identifier") then
    local bufnr = vim.api.nvim_get_current_buf()
    local identifier_text = vim.treesitter.get_node_text(log_target_node, bufnr)
    label = string.gsub(label, "%%identifier", identifier_text)
  end

  if string.find(label, "%%line_number") then
    local start_row = log_target_node:start()
    label = string.gsub(label, "%%line_number", start_row + 1)
  end

  return label
end

---@param label_text string
---@param identifier_text string
---@return string
local function build_log_statement(label_text, identifier_text)
  local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
  local template = M.log_templates[lang]

  template = string.gsub(template, "%%label", label_text)
  template = string.gsub(template, "%%identifier", identifier_text)

  return template
end

---@param line_number number
local function indent_line_number(line_number)
  local current_pos = vim.api.nvim_win_get_cursor(0)
  vim.api.nvim_win_set_cursor(0, { line_number, 0 })
  vim.cmd("normal! ==")
  vim.api.nvim_win_set_cursor(0, current_pos)
end

---@param label_template string
---@param log_target_node TSNode
---@param insert_line number
local function insert_log_statement(label_template, log_target_node, insert_line)
  local bufnr = vim.api.nvim_get_current_buf()
  local identifier_text = vim.treesitter.get_node_text(log_target_node, bufnr)
  local log_label = build_log_label(label_template, log_target_node)
  local log_statement = build_log_statement(log_label, identifier_text)
  vim.api.nvim_buf_set_lines(bufnr, insert_line, insert_line, false, { log_statement })
  indent_line_number(insert_line + 1)
end

---Query all target containers in the current buffer that intersect with the given range
---@alias logable_range {[1]: number, [2]: number}
---@param lang string
---@param range {[1]: number, [2]: number, [3]: number, [4]: number}
---@return {container: TSNode, logable_range: logable_range?}[]
local function query_log_target_container(lang, range)
  local bufnr = vim.api.nvim_get_current_buf()
  local parser = vim.treesitter.get_parser(bufnr, lang)
  local tree = parser:parse()[1]
  local root = tree:root()

  local query = vim.treesitter.query.get(lang, "neolog")
  if not query then
    vim.notify(string.format("logging_framework doesn't support %s language", lang), vim.log.levels.ERROR)
    return {}
  end

  local containers = {}

  for _, match, metadata in query:iter_matches(root, bufnr, 0, -1) do
    ---@type TSNode
    local log_container = match[utils.get_key_by_value(query.captures, "log_container")]

    local srow, scol, erow, ecol = log_container:range()
    if log_container and utils.ranges_intersect({ srow, scol, erow, ecol }, range) then
      ---@type TSNode?
      local logable_range = match[utils.get_key_by_value(query.captures, "logable_range")]

      local logable_range_col_range

      if metadata.adjusted_logable_range then
        logable_range_col_range = {
          metadata.adjusted_logable_range[1],
          metadata.adjusted_logable_range[3],
        }
      elseif logable_range then
        logable_range_col_range = { logable_range:start()[1], logable_range:end_()[1] }
      end

      table.insert(containers, { container = log_container, logable_range = logable_range_col_range })
    end
  end

  return containers
end

---Find all the log target nodes in the given container
---@param container TSNode
---@param lang string
---@return TSNode[]
local function find_log_target(container, lang)
  local query = vim.treesitter.query.parse(
    lang,
    [[
      ([
        (identifier)
        (shorthand_property_identifier_pattern)
      ]) @log_target
    ]]
  )

  local bufnr = vim.api.nvim_get_current_buf()
  local log_targets = {}
  for _, node in query:iter_captures(container, bufnr, 0, -1) do
    table.insert(log_targets, node)
  end

  return log_targets
end

--- Add log statement for the current identifier at the cursor
--- @alias position "above" | "below"
--- @param label_template string
--- @param position position
function M.add_log(label_template, position)
  local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
  if not lang then
    vim.notify("Cannot determine language for current buffer", vim.log.levels.ERROR)
    return
  end

  local query = vim.treesitter.query.get(lang, "neolog")
  if not query then
    vim.notify(string.format("logging_framework doesn't support %s language", lang), vim.log.levels.ERROR)
    return
  end

  local template = M.log_templates[lang]
  if not template then
    vim.notify(string.format("Log template for %s language is not found", lang), vim.log.levels.ERROR)
    return
  end

  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  -- TODO: support actual range
  local selection_range = { cursor_pos[1] - 1, cursor_pos[2], cursor_pos[1] - 1, cursor_pos[2] }
  local log_containers = query_log_target_container(lang, selection_range)

  for _, container in ipairs(log_containers) do
    local log_targets = find_log_target(container.container, lang)
    local logable_range = container.logable_range

    local insert_line

    if logable_range then
      insert_line = logable_range[1]
    else
      if position == "above" then
        insert_line = container.container:start()
      else
        insert_line = container.container:end_() + 1
      end
    end

    -- Filter targets that intersect with the given range
    for _, log_target in ipairs(log_targets) do
      local srow, scol, erow, ecol = log_target:range()
      if utils.ranges_intersect({ srow, scol, erow, ecol }, selection_range) then
        insert_log_statement(label_template, log_target, insert_line)
      end
    end
  end
end

-- Register the custom predicate
---@param templates NeologLogTemplates
function M.setup(templates)
  M.log_templates = templates

  -- Register the custom directive
  vim.treesitter.query.add_directive("adjust-range!", function(match, _, _, predicate, metadata)
    local capture_id = predicate[2]

    ---@type TSNode
    local node = match[capture_id]

    -- Get the adjustment values from the predicate arguments
    local start_adjust = tonumber(predicate[3]) or 0
    local end_adjust = tonumber(predicate[4]) or 0

    -- Get the original range
    local start_row, start_col, end_row, end_col = node:range()

    -- Adjust the range
    local adjusted_start_row = math.max(0, start_row + start_adjust) -- Ensure we don't go below 0
    local adjusted_end_row = math.max(adjusted_start_row, end_row + end_adjust) -- Ensure end is not before start

    -- Store the adjusted range in metadata
    metadata.adjusted_logable_range = { adjusted_start_row, start_col, adjusted_end_row, end_col }
  end, { force = true })
end

return M
