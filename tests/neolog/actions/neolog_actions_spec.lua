local neolog = require("neolog")
local helper = require("tests.neolog.helper")
local actions = require("neolog.actions")
local assert = require("luassert")

describe("neolog.actions", function()
  before_each(function()
    neolog.setup()
  end)

  it("supports %identifier in log template", function()
    neolog.setup({
      log_templates = {
        testing = {
          javascript = [[console.log("%identifier", %identifier)]],
        },
      },
    })

    helper.assert_scenario({
      input = [[
          // Comment
          const fo|o = "bar"
        ]],
      filetype = "javascript",
      action = function()
        actions.insert_log({ template = "testing", position = "below" })
      end,
      expected = [[
          // Comment
          const foo = "bar"
          console.log("foo", foo)
        ]],
    })
  end)

  it("supports %line_number in log template", function()
    neolog.setup({
      log_templates = {
        testing = {
          javascript = [[console.log("%line_number", %identifier)]],
        },
      },
    })

    helper.assert_scenario({
      input = [[
          // Comment
          const fo|o = "bar"
        ]],
      filetype = "javascript",
      action = function()
        actions.insert_log({ template = "testing", position = "below" })
      end,
      expected = [[
          // Comment
          const foo = "bar"
          console.log("2", foo)
        ]],
    })
  end)

  describe("supports %insert_cursor in log template", function()
    it("move the the %insert_cursor placeholder and go to insert mode after inserting the log", function()
      neolog.setup({
        log_templates = {
          testing = {
            javascript = [[console.log("%identifier %insert_cursor", %identifier)]],
          },
        },
      })

      helper.assert_scenario({
        input = [[
          const fo|o = "bar"
          const bar = "foo"
        ]],
        filetype = "javascript",
        action = function()
          actions.insert_log({
            template = "testing",
            position = "below",
          })

          vim.api.nvim_feedkeys("abc", "n", false)
        end,
        expected = function()
          local co = coroutine.running()

          -- Neovim doesn't move into insert mode immediately
          -- Sleep a bit
          vim.defer_fn(function()
            coroutine.resume(co)
          end, 100)

          coroutine.yield()

          local mode = vim.api.nvim_get_mode().mode
          assert.are.same("i", mode)

          local output = vim.api.nvim_buf_get_lines(0, 0, -1, false)
          local expected = {
            [[const foo = "bar"]],
            [[console.log("foo abc", foo)]],
            [[const bar = "foo"]],
          }
          assert.are.same(expected, output)
        end,
      })
    end)

    it("chooses the first statement if there are multiple", function()
      neolog.setup({
        log_templates = {
          testing = {
            javascript = [[console.log("%identifier %insert_cursor", %identifier)]],
          },
        },
      })

      helper.assert_scenario({
        input = [[
          const fo|o = bar + baz
        ]],
        filetype = "javascript",
        action = function()
          vim.cmd("normal! V")
          actions.insert_log({
            template = "testing",
            position = "below",
          })

          vim.api.nvim_feedkeys("abc", "n", false)
        end,
        expected = function()
          local co = coroutine.running()

          -- Neovim doesn't move into insert mode immediately
          -- Sleep a bit
          vim.defer_fn(function()
            coroutine.resume(co)
          end, 100)

          coroutine.yield()

          local mode = vim.api.nvim_get_mode().mode
          assert.are.same("i", mode)

          local output = vim.api.nvim_buf_get_lines(0, 0, -1, false)
          local expected = {
            [[const foo = bar + baz]],
            [[console.log("foo abc", foo)]],
            [[console.log("bar ", bar)]],
            [[console.log("baz ", baz)]],
          }
          assert.are.same(expected, output)
        end,
      })
    end)
  end)

  describe("supports log template that doesn't contain %identifier", function()
    it("inserts the log statement at the above line if position is 'above'", function()
      neolog.setup({
        log_templates = {
          plain = {
            javascript = [[console.log("Custom log %line_number")]],
          },
        },
      })

      helper.assert_scenario({
        input = [[
          // Comment
          const fo|o = "bar"
        ]],
        filetype = "javascript",
        action = function()
          actions.insert_log({ template = "plain", position = "below" })
        end,
        expected = [[
          // Comment
          const foo = "bar"
          console.log("Custom log 3")
        ]],
      })
    end)
    it("inserts the log statement at the above line if position is 'above'", function()
      neolog.setup({
        log_templates = {
          plain = {
            javascript = [[console.log("Custom log %line_number")]],
          },
        },
      })

      helper.assert_scenario({
        input = [[
          // Comment
          const fo|o = "bar"
        ]],
        filetype = "javascript",
        action = function()
          actions.insert_log({ template = "plain", position = "above" })
        end,
        expected = [[
          // Comment
          console.log("Custom log 2")
          const foo = "bar"
        ]],
      })
    end)
  end)
end)
