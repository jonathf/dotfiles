local snippet = require("snippets.utils").snippet

return {
	snippet("provider_ireland", 'provider "aws" {\n  region = "eu-west-1"\n}'),
	snippet("provider_namespace", 'provider "aws" {\n  region = module.namespace.region\n}'),
	snippet("namespace", {
		[[module "namespace" {
  source       = "gitlab.com/ruter-as/namespace/ml"
  version      = "]],
		1,
		[["
  project_name = "]],
		2,
		[["
  maintainer   = "]],
		3,
		[[@ruter.no"
}]],
	}),
	snippet("s3-bucket", {
		[[module "s3_bucket" {
	source = "gitlab.com/ruter-as/s3-bucket/ml"
	version = "]],
		1,
		[["
	namespace = module.namespace]],
	}),
	snippet("(resource|data|variable|output)", {
		function(snip)
			return snip.capture[1]
		end,
		' "',
		1,
		'" "',
		2,
		'" {',
		0,
		" }",
	}),
}
-- snippet(
-- 	{ trig = "^resource ([%w_]+)", regTrig = true, hidden = true },
-- 	func(function(_, snip)
-- 		return 'resource "' .. snip.captures[1] .. '" '
-- 	end, {})
-- ),
-- snippet(
-- 	{ trig = "^data ([%w_]+)", regTrig = true, hidden = true },
-- 	func(function(_, snip)
-- 		return 'data "' .. snip.captures[1] .. '" '
-- 	end, {})
-- ),
-- snippet(
-- 	{ trig = "^variable ([%w_]+)", regTrig = true, hidden = true },
-- 	func(function(_, snip)
-- 		return 'data "' .. snip.captures[1] .. '" '
-- 	end, {})
-- ),
-- snippet(
-- 	{ trig = '^(resource "[%w_]+") ([a-z-]+)', regTrig = true, hidden = true },
-- 	func(function(_, args)
-- 		return args.captures[1] .. ' "' .. args.captures[2] .. '"'
-- 	end, {})
-- ),
-- snippet(
-- 	{ trig = '^(data "[%w_]+") ([a-z-]+)', regTrig = true, hidden = true },
-- 	func(function(_, args)
-- 		return args.captures[1] .. ' "' .. args.captures[2] .. '"'
-- 	end, {})
-- ),
-- -- snippet({trig = "^(resource|data) \"([a-z-]+)\" ([a-z_]+)", regTrig = true, hidden = true},
-- --   func(function(_, args) return args.captures[1] .. " \"" .. args.captures[2] .. "\" \"" .. args.captures[3] .. "\"" end, {})),
