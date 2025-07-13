local utils = require("snippets.utils")

---@param types string[] Will return the first node that matches one of these types
---@param node TSNode|nil
---@return TSNode|nil
local function find_node_ancestor(types, node)
	if not node then
		return nil
	end
	if vim.tbl_contains(types, node:type()) then
		return node
	end
	local parent = node:parent()
	return find_node_ancestor(types, parent)
end

local function get_parent(node, verify_type)
	if node == nil then
		return nil
	end
	local parent = node:parent()
	if parent == nil then
		return nil
	end
	if verify_type ~= nil and parent:type() ~= verify_type then
		return nil
	end
	return parent
end

local function in_docstring()
	local current_node = vim.treesitter.get_node({ ignore_injections = false })
	local string_node = get_parent(current_node, "string")
	local expression_node = get_parent(string_node, "expression_statement")
	local block_node = get_parent(expression_node, "block")
	local function_node = get_parent(block_node, "function_definition")
	return function_node ~= nil and block_node ~= nil and block_node:child(0) == expression_node
end

local function expand_args()
	local tab = string.rep(" ", vim.o.shiftwidth)
	local out = { "Args:" }
	local current_node = vim.treesitter.get_node({ ignore_injections = false })
	local function_node = find_node_ancestor({ "function_definition" }, current_node)
	if function_node == nil then
		return out
	end
	local parameter_node = function_node:named_child(1):child(0)
	local ls = require("luasnip")
	while parameter_node ~= nil do
		-- without type annotation
		if parameter_node:type() == "identifier" then
			local parameter_text = vim.treesitter.get_node_text(parameter_node, 0)
			vim.print(parameter_text)
			if parameter_text ~= "self" then
				out[#out + 1] = tab .. parameter_text .. ":"
				-- out[#out + 1] = ls.insert_node(#out / 2 - 1)
			end
		-- with type annotation
		elseif parameter_node:type() == "typed_parameter" then
			local child = parameter_node:child(0)
			if child ~= nil then
				local parameter_text = vim.treesitter.get_node_text(child, 0)
				out[#out + 1] = tab .. parameter_text .. ":"
			end
		end
		parameter_node = parameter_node:next_sibling()
	end
	return out
end

return {
	utils.snippet("doctest", "doctest: +SKIP", { hidden = false }),
	utils.snippet("doctest: +SKIP", "doctest: +NORMALIZE_WHITESPACE"),
	utils.snippet("doctest: +NORMALIZE_WHITESPACE", "doctest: +ELLIPSIS"),
	utils.snippet("doctest: +ELLIPSIS", "doctest: +IGNORE_EXCEPTION_DETAILS"),
	utils.snippet("doctest: +IGNORE_EXCEPTION_DETAILS", "doctest: +SKIP"),
	utils.snippet("__name__", '__name__ == "__main__":'),
	utils.snippet("from pathlib", "from pathlib import Path"),
	utils.snippet('""', { '"""', 0, '"""' }),
	utils.snippet('"', '""'),
	utils.snippet("''", { "'''", 0, "'''" }),
	utils.snippet("'", "''"),
	utils.snippet("assert", "assert False"),
	utils.snippet("Args:", expand_args, { condition = in_docstring }),
	utils.snippet("logger", "logger = logging.getLogger(__name__)"),
	utils.snippet("from pathlib", "from pathlib import Path"),
	utils.snippet("embed", "from IPython import embed; embed()"),
}
-- {
-- 	--- doctest stuff
-- 	snippet({ trig = "doctest:" }, t("doctest: +SKIP")),
-- 	snippet({ trig = "doctest: +SKIP", hidden = true }, t("doctest: +NORMALIZE_WHITESPACE")),
-- 	snippet({ trig = "doctest: +NORMALIZE_WHITESPACE", hidden = true }, t("doctest: +ELLIPSIS")),
-- 	snippet({ trig = "doctest: +ELLIPSIS", hidden = true }, t("doctest: +IGNORE_EXCEPTION_DETAILS")),
-- 	snippet({ trig = "doctest: +IGNORE_EXCEPTION_DETAILS", hidden = true }, t("doctest: +SKIP")),
-- 	snippet({ trig = "__name__" }, fmt('__name__ == "__main__":', {})),
-- 	snippet({ trig = "from pathlib" }, fmt("from pathlib import Path", {})),
--
-- 	--- string stuff
-- 	-- snippet({trig = ":", hidden = true}, {t{":", '    """'}, insert(0), t'"""'}),
-- 	snippet({ trig = '""', hidden = true }, { t('"""'), insert(0), t('"""') }),
-- 	snippet({ trig = '"', hidden = true }, t('""')),
-- 	snippet({ trig = "''", hidden = true }, { t("'''"), insert(0), t("'''") }),
-- 	snippet({ trig = "'", hidden = true }, t("''")),
--
-- 	snippet(
-- 		{ trig = "^(%s*)assert", regTrig = true, hidden = true },
-- 		func(function(_, snip)
-- 			local cap = snip.captures[1]
-- 			if cap == nil then
-- 				cap = ""
-- 			end
-- 			return cap .. "assert False"
-- 		end, {})
-- 	),
-- 	snippet(
-- 		{ trig = "Args", regTrig = false, hidden = false },
-- 		func(expand_args, {}),
-- 		{ condition = in_docstring }
-- 	),
-- 	snippet(
-- 		{ trig = "Args:", regTrig = false, hidden = true },
-- 		func(expand_args, {}),
-- 		{ condition = in_docstring }
-- 	),
-- 	snippet(
-- 		{ trig = "assert False", hidden = true },
-- 		{ t({ 'assert False, f"""', "{" }), insert(0), t({ "}", '"""' }) }
-- 	),
-- 	snippet({ trig = "logger" }, t("logger = logging.getLogger(__name__)")),
-- 	snippet({ trig = "log" }, fmt('logger.debug("{}")', { insert(0) })),
-- 	snippet({ trig = 'logger.debug("', hidden = true }, t('logger.info("')),
-- 	snippet({ trig = 'logger.info("', hidden = true }, t('logger.warning("')),
-- 	snippet({ trig = 'logger.warning("', hidden = true }, t('logger.error("')),
-- 	snippet({ trig = 'logger.error("', hidden = true }, t('logger.debug("')),
-- 	-- snippet({trig = "print"}, fmt('print(f"{{{}=}}")', {insert(0)}))
-- },
