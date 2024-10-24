local neolog = require("neolog")
local helper = require("tests.neolog.helper")
local actions = require("neolog.actions")

describe("javascript single log", function()
  before_each(function()
    neolog.setup({
      log_templates = {
        default = {
          javascript = [[console.log("%identifier", %identifier)]],
        },
      },
    })
  end)

  require("tests.neolog.actions.lang.javascript_base")("javascript")

  it("supports switch clause", function()
    helper.assert_scenario({
      input = [[
        switch (foo) {
          case ba|r:
            break
          case "baz":
            break
        }
      ]],
      filetype = "javascript",
      action = function()
        actions.insert_log({ position = "below" })
      end,
      expected = [[
        switch (foo) {
          case bar:
            console.log("bar", bar)
            break
          case "baz":
            break
        }
      ]],
    })

    helper.assert_scenario({
      input = [[
        switch (foo) {
          case (ba|r + baz): {
            break
          }
          case "baz":
            const baz = "baz"
            break
        }
      ]],
      filetype = "javascript",
      action = function()
        vim.cmd("normal! vi{V")
        actions.insert_log({ position = "below" })
      end,
      expected = [[
        switch (foo) {
          case (bar + baz): {
            console.log("bar", bar)
            console.log("baz", baz)
            break
          }
          case "baz":
            const baz = "baz"
            console.log("baz", baz)
            break
        }
      ]],
    })
  end)
end)

describe("javascript batch log", function()
  before_each(function()
    actions.clear_batch()
  end)

  it("supports batch log", function()
    neolog.setup({
      batch_log_templates = {
        default = {
          javascript = [[console.log("Testing %line_number", { %repeat<"%identifier": %identifier><, > })]],
        },
      },
    })

    local input = [[
      const fo|o = "foo"
      const bar = "bar"
      const baz = "baz"
    ]]

    helper.assert_scenario({
      input = input,
      filetype = "javascript",
      action = function()
        vim.cmd("normal! V2j")
        actions.add_log_targets_to_batch()
        actions.insert_batch_log()
      end,
      expected = [[
        const foo = "foo"
        const bar = "bar"
        const baz = "baz"
        console.log("Testing 4", { "foo": foo, "bar": bar, "baz": baz })
      ]],
    })
  end)
end)
