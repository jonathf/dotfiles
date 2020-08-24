local awful = require("awful")
config_path = awful.util.getdir("config")

local beautiful = require("beautiful")
beautiful.init(config_path .. "theme.lua" )

require("awful.remote")

dofile(config_path .. "errors.lua")
dofile(config_path .. "keybinds.lua")
dofile(config_path .. "layout.lua")
dofile(config_path .. "programs.lua")
