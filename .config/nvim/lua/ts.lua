local function get_nodes(query_text, predicate)
	local end_row = vim.api.nvim_win_get_cursor(0)[1]
	local ft = vim.bo.filetype -- vim.api.nvim_buf_get_option(0, 'filetype')
	assert(ft == "python", "test_method of dap-python only works for python files, not " .. ft)
	local query = vim.treesitter.query.parse(ft, query_text)
	assert(query, "Could not parse treesitter query. Cannot find test")
	local parser = vim.treesitter.get_parser(0)
	local root = (parser:parse()[1]):root()
	local nodes = {}
	for _, node in query:iter_captures(root, 0, 0, end_row) do
		if predicate(node) then
			table.insert(nodes, node)
		end
	end
	return nodes
end

local function get_function_nodes()
	local query_text = [[
    (function_definition
      name: (identifier) @name) @definition.function
  ]]
	return get_nodes(query_text, function(node)
		return node:type() == "identifier"
	end)
end

local function get_class_nodes()
	local query_text = [[
    (class_definition
      name: (identifier) @name) @definition.class
  ]]
	return get_nodes(query_text, function(node)
		return node:type() == "identifier"
	end)
end

local function get_args_nodes()
	local query_text = [[
    (
      function_definition
      parameters: (
        parameters
        (identifier) @parameter
      ) @definition.args
    ) @definition.function
  ]]
	return get_nodes(query_text, function(node)
		return node:type() == "identifier"
	end)
end

local function closest_above_cursor(nodes)
	local result
	for _, node in pairs(nodes) do
		if not result then
			result = node
		else
			local node_row1, _, _, _ = node:range()
			local result_row1, _, _, _ = result:range()
			if node_row1 > result_row1 then
				result = node
			end
		end
	end
	return result
end

local function get_node_text(node)
	local row1, col1, row2, col2 = node:range()
	if row1 == row2 then
		row2 = row2 + 1
	end
	local lines = vim.api.nvim_buf_get_lines(0, row1, row2, true)
	if #lines == 1 then
		return (lines[1]):sub(col1 + 1, col2)
	end
	return table.concat(lines, "\n")
end

local function get_parent_classname(node)
	local parent = node:parent()
	while parent do
		local type = parent:type()
		if type == "class_definition" then
			for child in parent:iter_children() do
				if child:type() == "identifier" then
					return get_node_text(child)
				end
			end
		end
		parent = parent:parent()
	end
end

-- local function in_context(string)
--   local query = vim.treesitter.parse_query(vim.bo.filetype, string)
--   local row = vim.fn.line(".")-1
--   local col = vim.fn.col(".")
--   local parser = vim.treesitter.get_parser(0)
--   local root = parser:parse()[1]:root()
--   for _, match in query:iter_matches(root, 0) do
--     for _, node in pairs(match) do
--       local r1, c1, r2, c2 = node:range()
--       if r1 <= row and r2 >= row then
--         if (r2 == row and c2 >= col) or
--           (r1 == row and c1 <= col) or
--           (r1 < row and r2 > row)
--         then
--           return true
--         end
--       end
--     end
--   end
--   return false
-- end

-- local function in_comment() return in_context("(comment) @comment") end
-- local function in_string() return in_context("(string) @string") end

M = {}

local function get_outer_function_node()
	local ts_utils = require("nvim-treesitter.ts_utils")
	local node = ts_utils.get_node_at_cursor()
	local candidate = nil
	while node do
		vim.print(ts_utils.get_node_text(node))
		if node:type() == "function_definition" then
			candidate = node
		end
		node = node:parent()
	end
	return candidate
end

M.args = function()
	local function_node = closest_above_cursor(get_function_nodes())
	if not function_node then
		print("No suitable test method found")
		return
	end
	print(get_node_text(function_node))
	for child in function_node:iter_children() do
		if child:type() == "parameters" then
			local out = {}
			for gchild in child:iter_children() do
				if gchild:type() == "identifier" then
					out[#out + 1] = get_node_text(gchild)
				elseif gchild:type() == "typed_parameter" then
					out[#out + 1] = get_node_text(gchild:child(0))
				end
			end
			return out
		end
	end
end

M.func = function()
	local function_node = closest_above_cursor(get_function_nodes())
	if function_node == nil then
		print("No suitable test method found")
		return ""
	end
	local class = get_parent_classname(function_node)
	local function_name = get_node_text(function_node)
	if class == nil then
		return function_name
	end
	return class .. "." .. function_name
end

M.class = function()
	local class_node = closest_above_cursor(get_class_nodes())
	if not class_node then
		print("No suitable test class found")
		return
	end
	local class = get_node_text(class_node)
	return class
end

return M
