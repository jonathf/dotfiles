local luasnip = require("luasnip")

local M = {}

local function process_target(target)
	if type(target) ~= "table" then
		target = { target }
	end
	for key, value in pairs(target) do
		if type(value) == "function" then
			target[key] = luasnip.function_node(function(_, args)
				return value(args)
			end, {})
		elseif type(value) == "string" or type(value) == "table" then
			target[key] = luasnip.text_node(value)
		elseif type(value) == "number" then
			target[key] = luasnip.insert_node(value)
		end
	end
	return target
end

M.snippet = function(source, target, opts)
	opts = opts or {}
	target = process_target(target)
	return luasnip.snippet({
		trig = source,
		hidden = opts.hidden or true,
		dscr = opts.dscr,
		wordTrig = false,
		trigEngine = "pattern",
	}, target, { condition = opts.condition })
end

return M
