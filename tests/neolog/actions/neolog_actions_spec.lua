local neolog = require("neolog")
local helper = require("tests.neolog.helper")
local actions = require("neolog.actions")

describe("neolog.actions", function()
  it("supports %identifier in label template", function()
    neolog.setup()

    helper.assert_scenario({
      input = [[
          // Comment
          const fo|o = "bar"
        ]],
      filetype = "typescript",
      action = function()
        actions.add_log("%identifier", "below")
      end,
      expected = [[
          // Comment
          const foo = "bar"
          console.log("foo", foo)
        ]],
    })
  end)

  it("supports %line_number in label template", function()
    neolog.setup()

    helper.assert_scenario({
      input = [[
          // Comment
          const fo|o = "bar"
        ]],
      filetype = "typescript",
      action = function()
        actions.add_log("%line_number", "below")
      end,
      expected = [[
          // Comment
          const foo = "bar"
          console.log("2", foo)
        ]],
    })
  end)
end)
