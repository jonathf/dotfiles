local function filepath_exists(file)
  local ok, _, code = os.rename(file, file)
  if not ok and code ~= 13 and code ~= 16 then
    return false
  end
  return true
end

local function folder_exists(_, trigger)
  return trigger:sub(1, 1) == "/" and trigger:sub(-1) ~= "/" and filepath_exists(trigger.."/")
end

local function expand_underline(_, args)
  local cur = vim.api.nvim_win_get_cursor(0)
  local aline = vim.api.nvim_buf_get_lines(0, cur[1]-2, cur[1]-1, false)
  local length = string.len(aline[1])-string.len(args.indentstr)
  return string.rep(args.captures[1], length)
end

return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  config = function()
    local luasnip = require "luasnip"

    local snippet = luasnip.snippet
    -- local snip_node = luasnip.snip_node
    local t = luasnip.text_node
    local insert = luasnip.insert_node
    local func = luasnip.function_node
    -- local dynamic = luasnip.dynamic_node
    -- local choice = luasnip.choice_node
    local fmt = require"luasnip.extras.fmt".fmt
    -- local conditions = require"luasnip.extras.conditions"


    luasnip.add_snippets(nil, {
      all = {
        snippet({trig = "true", hidden = true}, t"false"),
        snippet({trig = "false", hidden = true}, t"true"),
        snippet({trig = "True", hidden = true}, t"False"),
        snippet({trig = "False", hidden = true}, t"True"),
        snippet({trig = "~", hidden = true}, t"$HOME"),

        --- Substitute environment variable names with their corresponding value
        snippet({trig = "$[a-zA-Z-_]+", regTrig = true, hidden = true},
          func(function(_, args)
            local out = os.getenv(args.trigger:sub(2))
            if out == nil then
              return args.trigger
            end
            return out
          end, {})),

        --- Repeat special char to be same
        snippet({trig = "(-)-+", regTrig = true, hidden = true}, func(expand_underline, {})),
        snippet({trig = "(=)=+", regTrig = true, hidden = true}, func(expand_underline, {})),
        snippet({trig = "(~)~+", regTrig = true, hidden = true}, func(expand_underline, {})),
        snippet({trig = "(#)#+", regTrig = true, hidden = true}, func(expand_underline, {})),

        --- Expand date
        snippet({trig = "20", dscr = "Today's date"}, func(function() return os.date("%Y-%m-%d") end, {})),

        --- Expand folders to end with /
        snippet(
          {trig = "[a-zA-Z0-9-_./]+", regTrig = true, hidden = true},
          func(function(_, args) return args.trigger.."/" end, {}),
          {condition = folder_exists}),

        --- codeblock stuff
        snippet({trig = "`", hidden = true}, t"``"),
        snippet({trig = "``", hidden = true}, {t{"```", ""}, insert(0), t{"", "```"}}),
        snippet({trig = "()", hidden = true}, {t{"(", ""}, insert(0), t{"", ")"}}),
        snippet({trig = "{}", hidden = true}, {t{"{", ""}, insert(0), t{"", "}"}}),
        snippet({trig = "[]", hidden = true}, {t{"[", ""}, insert(0), t{"", "]"}}),
      },
      python = {
        --- doctest stuff
        snippet({trig = "doctest:"}, t"doctest: +SKIP"),
        snippet({trig = "doctest: +SKIP", hidden = true}, t"doctest: +NORMALIZE_WHITESPACE"),
        snippet({trig = "doctest: +NORMALIZE_WHITESPACE", hidden = true}, t"doctest: +ELLIPSIS"),
        snippet({trig = "doctest: +ELLIPSIS", hidden = true}, t"doctest: +IGNORE_EXCEPTION_DETAILS"),
        snippet({trig = "doctest: +IGNORE_EXCEPTION_DETAILS", hidden = true}, t"doctest: +SKIP"),
        snippet({trig = "__name__",}, fmt('__name__ == "__main__":', {})),
        snippet({trig = "from pathlib",}, fmt('from pathlib import Path', {})),

        --- string stuff
        -- snippet({trig = ":", hidden = true}, {t{":", '    """'}, insert(0), t'"""'}),
        snippet({trig = '""', hidden = true}, {t'"""', insert(0), t'"""'}),
        snippet({trig = '"', hidden = true}, t'""'),
        snippet({trig = "''", hidden = true}, {t"'''", insert(0), t"'''"}),
        snippet({trig = "'", hidden = true}, t"''"),

        snippet({trig = "^(%s*)assert", regTrig = true, hidden = true},
        func(function(_, snip)
          local cap = snip.captures[1]
          if cap == nil then cap = "" end
          return cap .. 'assert False'
        end, {})),
        snippet({trig = "assert False", hidden = true}, {t{'assert False, f"""', "{"}, insert(0), t{"}", '"""'}}),
        snippet({trig = "logger"}, t"logger = logging.getLogger(__name__)"),
        snippet({trig = "log"}, fmt("logger.debug(\"{}\")", {insert(0)})),
        snippet({trig = "logger.debug(\"", hidden = true}, t"logger.info(\""),
        snippet({trig = "logger.info(\"", hidden = true}, t"logger.warning(\""),
        snippet({trig = "logger.warning(\"", hidden = true}, t"logger.error(\""),
        snippet({trig = "logger.error(\"", hidden = true}, t"logger.debug(\""),
        -- snippet({trig = "print"}, fmt('print(f"{{{}=}}")', {insert(0)}))
      },
      terraform = {
        snippet({trig = "^resource ([%w_]+)", regTrig = true, hidden = true},
          func(function(_, snip) return "resource \"" .. snip.captures[1] .. "\" " end, {})),
        snippet({trig = "^data ([%w_]+)", regTrig = true, hidden = true},
          func(function(_, snip) return "data \"" .. snip.captures[1] .. "\" " end, {})),
        snippet({trig = "^variable ([%w_]+)", regTrig = true, hidden = true},
          func(function(_, snip) return "data \"" .. snip.captures[1] .. "\" " end, {})),
        snippet({trig = "^(resource \"[%w_]+\") ([a-z-]+)", regTrig = true, hidden = true},
          func(function(_, args) return args.captures[1] .. " \"" .. args.captures[2] .. "\"" end, {})),
        snippet({trig = "^(data \"[%w_]+\") ([a-z-]+)", regTrig = true, hidden = true},
          func(function(_, args) return args.captures[1] .. " \"" .. args.captures[2] .. "\"" end, {})),
        -- snippet({trig = "^(resource|data) \"([a-z-]+)\" ([a-z_]+)", regTrig = true, hidden = true},
        --   func(function(_, args) return args.captures[1] .. " \"" .. args.captures[2] .. "\" \"" .. args.captures[3] .. "\"" end, {})),
      },
    })
  end,
}
