local cmp = require"cmp"
local luasnip = require"luasnip"
local snippet = luasnip.snippet
local snip_node = luasnip.snip_node
local text = luasnip.text_node
local insert = luasnip.insert_node
local func = luasnip.function_node
local dynamic = luasnip.dynamic_node

-- Every unspecified option will be set to the default.
luasnip.config.set_config{
  history = true,
  -- Update more often, :h events for more info.
  updateevents = "TextChanged,TextChangedI",
}

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

local function in_comment()
  local query = vim.treesitter.parse_query(vim.bo.filetype, "(comment) @comment")
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

local function expand_underline(_, args)
  local cur = vim.api.nvim_win_get_cursor(0)
  local aline = vim.api.nvim_buf_get_lines(0, cur[1]-2, cur[1]-1, false)
  local length = string.len(aline[1])-string.len(args.indentstr)
  return string.rep(args.captures[1], length)
end

luasnip.snippets = {
  all = {
    snippet({trig = "true", hidden = true}, text("false")),
    snippet({trig = "false", hidden = true}, text("true")),
    snippet({trig = "True", hidden = true}, text("False")),
    snippet({trig = "False", hidden = true}, text("True")),
    snippet({trig = "~", hidden = true}, func(function(_, args) return os.getenv("HOME") end, {})),

    --- Repeat special char to be same
    snippet({trig = "(-)--+", regTrig = true, hidden = true}, func(expand_underline, {})),
    snippet({trig = "(=)==+", regTrig = true, hidden = true}, func(expand_underline, {})),
    snippet({trig = "(~)~~+", regTrig = true, hidden = true}, func(expand_underline, {})),
    snippet({trig = "(#)##+", regTrig = true, hidden = true}, func(expand_underline, {})),

    --- Expand date
    snippet({trig = "20", dscr = "Today's date"}, func(function(_, args) return os.date("%Y-%m-%d") end, {})),

    --- Expand folders to end with /
    snippet(
      {trig = "[a-zA-Z0-9-_./]+", regTrig = true, hidden = true},
      func(function(_, args) return args.trigger.."/" end, {}),
      {condition = folder_exists}),
    },
  python = {
    --- doctest stuff
    snippet("doctest", text("doctest: +SKIP"), {condition=in_comment}),
    snippet({trig = "doctest: +SKIP", hidden = true}, text("doctest: +NORMALIZE_WHITESPACE"), {condition=in_comment}),
    snippet({trig = "doctest: +NORMALIZE_WHITESPACE", hidden = true}, text("doctest: +ELLIPSIS"), {condition=in_comment}),
    snippet({trig = "doctest: +ELLIPSIS", hidden = true}, text("doctest: +IGNORE_EXCEPTION_DETAILS"), {condition=in_comment}),
    snippet({trig = "doctest: +IGNORE_EXCEPTION_DETAILS", hidden = true}, text("doctest: +SKIP"), {condition=in_comment}),

    --- string stuff
    snippet({trig = ":", hidden = true}, {text({":", '    """'}), insert(1), text('"""')}),
    snippet({trig = '""', hidden = true}, {text('"""'), insert(1), text('"""')}),
    snippet({trig = '"', hidden = true}, text('""')),
    snippet({trig = "''", hidden = true}, {text("'''"), insert(1), text("'''")}),
    snippet({trig = "'", hidden = true}, text("''")),
  },
  markdown = {
    --- codeblock stuff
    snippet("``", {text("```"), insert(1), text("```")}),
    snippet("`", text("``")),
  },
  plaintex = {
    snippet({trig = "\\?begin", regTrig = true},
      {text("\\begin{"), insert(1), text("}")}),
    snippet({trig = "\\begin%{(%w+)%}", regTrig = true}, {func(function(_, args)
      return args.trigger end, {}), text({"", ""}), func(function(_, args)
        return "\\end{"..args.captures[1].."}" end, {})})
  },
}
