return {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
	config = function()
		require("luasnip").add_snippets(nil, require("snippets"))
	end,
}
