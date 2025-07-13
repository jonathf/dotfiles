local luasnip = require("luasnip")
local snippet = require("snippets.utils").snippet

local function filepath_exists(file)
	local ok, _, code = os.rename(file, file)
	if not ok and code ~= 13 and code ~= 16 then
		return false
	end
	return true
end

local function folder_exists(_, trigger)
	return trigger:sub(1, 1) == "/" and trigger:sub(-1) ~= "/" and filepath_exists(trigger .. "/")
end

local function expand_underline(args)
	local cur = vim.api.nvim_win_get_cursor(0)
	local aline = vim.api.nvim_buf_get_lines(0, cur[1] - 2, cur[1] - 1, false)
	local length = string.len(aline[1]) - string.len(args.indentstr)
	return string.rep(args.captures[1], length)
end

return {
	snippet("true", "false"),
	snippet("false", "true"),
	snippet("True", "False"),
	snippet("False", "True"),
	snippet("jonathan", "jonathan.feinberg@ruter.no"),

	--- Substitute environment variable names with their corresponding value
	snippet("$[a-zA-Z-_]+", function(args)
		return os.getenv(args.trigger:sub(2)) or args.trigger
	end),

	--- Repeat special char to be same
	snippet("(-)-+", expand_underline),
	snippet("(=)=+", expand_underline),
	snippet("(~)~+", expand_underline),
	snippet("(#)#+", expand_underline),
	snippet("~", "$HOME"),

	--- Expand date
	snippet("20", function()
		return os.date("%Y-%m-%d")
	end, { dscr = "Today's date", hidden = false }),
	snippet("20%d%d", function(args)
		return args.trigger .. "-01-01"
	end, { dscr = "First day of the year", hidden = true }),
	snippet("20%d%d[-]%d%d", function(args)
		return args.trigger .. "-01"
	end, { dscr = "First day of the month", hidden = true }),
	snippet("20%d%d[-]%d%d[-]%d%d", function(args)
		return args.trigger .. "T00:00"
	end, { dscr = "First minute of the day", hidden = true }),
	snippet("20%d%d[-]%d%d[-]%d%dT%d%d", function(args)
		return args.trigger .. ":00"
	end, { dscr = "First minute of the hour", hidden = true }),
	snippet("20%d%d[-]%d%d[-]%d%dT%d%d:%d%d", function(args)
		return args.trigger .. ":00"
	end, { dscr = "First second of the minute", hidden = true }),
	snippet("20%d%d[-]%d%d[-]%d%dT%d%d:%d%d:%d%d", function(args)
		return args.trigger .. ".00000"
	end, { dscr = "First nanosecond of the second", hidden = true }),
	snippet("20%d%d[-]%d%d[-]%d%dT%d%d:%d%d:%d%d.%d%d%d%d%d", function(args)
		return args.trigger .. "Z"
	end, { dscr = "Add zulu", hidden = true }),

	--- Expand folders to end with /
	snippet("[a-zA-Z0-9-_./]+[^/]", function(args)
		return args.trigger .. "/"
	end, { condition = folder_exists }),

	--- codeblock stuff
	snippet("``", { { "```", "" }, 0, { "", "```" } }),
	snippet("`", "``"),
}
