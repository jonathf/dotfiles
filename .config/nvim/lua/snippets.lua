local cmp = require "cmp"
local luasnip = require "luasnip"
local snippet = luasnip.snippet
local snip_node = luasnip.snip_node
local t = luasnip.text_node
local insert = luasnip.insert_node
local func = luasnip.function_node
local dynamic = luasnip.dynamic_node
local choice = luasnip.choice_node
local fmt = require("luasnip.extras.fmt").fmt

local function filepath_exists(file)
  local ok, err, code = os.rename(file, file)
  if not ok and code ~= 13 and code ~= 16 then
    return false
  end
  return true
end

local function folder_exists(_, trigger)
  return trigger:sub(1, 1) == "/" and trigger:sub(-1) ~= "/" and filepath_exists(trigger.."/")
end

local function in_context(string)
  local query = vim.treesitter.parse_query(vim.bo.filetype, string)
  local row = vim.fn.line(".")-1
  local col = vim.fn.col(".")
  local parser = vim.treesitter.get_parser(0)
  local root = parser:parse()[1]:root()
  for _, match in query:iter_matches(root, 0) do
    for _, node in pairs(match) do
      local r1, c1, r2, c2 = node:range()
      if r1 <= row and r2 >= row then
        if (r2 == row and c2 >= col) or
          (r1 == row and c1 <= col) or
          (r1 < row and r2 > row)
        then
          return true
        end
      end
    end
  end
  return false
end

local function in_comment() return in_context("(comment) @comment") end
local function in_string() return in_context("(string) @string") end


local function expand_underline(_, args)
  local cur = vim.api.nvim_win_get_cursor(0)
  local aline = vim.api.nvim_buf_get_lines(0, cur[1]-2, cur[1]-1, false)
  local length = string.len(aline[1])-string.len(args.indentstr)
  return string.rep(args.captures[1], length)
end

luasnip.add_snippets(nil, {
  all = {
    snippet({trig = "true", hidden = true}, t"false"),
    snippet({trig = "false", hidden = true}, t"true"),
    snippet({trig = "True", hidden = true}, t"False"),
    snippet({trig = "False", hidden = true}, t"True"),
    snippet({trig = "~", hidden = true}, func(function(_, args) return os.getenv("HOME") end, {})),

    --- Repeat special char to be same
    snippet({trig = "(-)-+", regTrig = true, hidden = true}, func(expand_underline, {})),
    snippet({trig = "(=)=+", regTrig = true, hidden = true}, func(expand_underline, {})),
    snippet({trig = "(~)~+", regTrig = true, hidden = true}, func(expand_underline, {})),
    snippet({trig = "(#)#+", regTrig = true, hidden = true}, func(expand_underline, {})),

    --- Expand date
    snippet({trig = "20", dscr = "Today's date"}, func(function(_, args) return os.date("%Y-%m-%d") end, {})),

    --- Expand folders to end with /
    snippet(
      {trig = "[a-zA-Z0-9-_./]+", regTrig = true, hidden = true},
      func(function(_, args) return args.trigger.."/" end, {}),
      {condition = folder_exists}),

    --- codeblock stuff
    snippet("``", {t{"```", ""}, insert(0), t{"", "```"}}),
    snippet("`", t"``"),
  },
  python = {
    --- doctest stuff
    snippet({trig = "doctest:"}, t"doctest: +SKIP"),
    snippet({trig = "doctest: +SKIP", hidden = true}, t"doctest: +NORMALIZE_WHITESPACE"),
    snippet({trig = "doctest: +NORMALIZE_WHITESPACE", hidden = true}, t"doctest: +ELLIPSIS"),
    snippet({trig = "doctest: +ELLIPSIS", hidden = true}, t"doctest: +IGNORE_EXCEPTION_DETAILS"),
    snippet({trig = "doctest: +IGNORE_EXCEPTION_DETAILS", hidden = true}, t"doctest: +SKIP"),
    snippet({trig = "__name__"}, fmt('__name__ == "__main__":\n    {}', {insert(0, "pass")})),

    --- string stuff
    snippet({trig = ":", hidden = true}, {t{":", '    """'}, insert(0), t'"""'}),
    snippet({trig = '""', hidden = true}, {t'"""', insert(0), t'"""'}),
    snippet({trig = '"', hidden = true}, t'""'),
    snippet({trig = "''", hidden = true}, {t"'''", insert(0), t"'''"}),
    snippet({trig = "'", hidden = true}, t"''"),

    snippet({trig = "assert"}, fmt('assert False, f"""\n{{{}}}\n"""', {insert(1)})),
    snippet({trig = "logger"}, t"logger = logging.getLogger(__name__)"),
    snippet({trig = "log"}, fmt("logger.debug(\"{}\")", {insert(0)})),
    snippet({trig = "loggger.debug(\"", hidden = true}, t"logger.info(\""),
    snippet({trig = "loggger.info(\"", hidden = true}, t"logger.warning(\""),
    snippet({trig = "loggger.warning(\"", hidden = true}, t"logger.error(\""),
    snippet({trig = "loggger.error(\"", hidden = true}, t"logger.debug(\""),
    snippet({trig = "print"}, fmt('print(f"{{{}=}}")', {insert(1)}))
  },
  tex = {
    snippet({trig = "\\?begin", regTrig = true, hidden = true},
      fmt("\\begin{{{}}}\n\\end{{{}}}", {insert(1, "environment"), func(function(args) return args[1][1] end, {1})})),
      -- {t"\\begin{", insert(1, "environment"),
      --  t"}", insert(0), t{"", "\\end{"},
      --  func(function(args) return args[1][1] end, {1}), t"}"}),
    snippet("begin",
      {t"\\begin{", insert(1, "environment"),
       t"}", insert(0), t{"", "\\end{"},
       func(function(args) return args[1][1] end, {1}), t"}"}),
  },
})
