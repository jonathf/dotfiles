local awful = require("awful")

terminal = "urxvt --meta8"
terminal = "alacritty"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Window transparency
awful.spawn("nm-applet")
awful.spawn.once("xcompmgr -cF")
-- awful.spawn.once("compton -b")
-- awful.spawn.once("picom --experimental-backends")

awful.spawn.once("setxkbmap -layout no")

-- Applets
awful.spawn.once("blueman-applet")
awful.spawn.once("powerkit")
awful.spawn.once("xinput set-prop \"ELAN0670:00 04F3:3150\" \"Synaptics Palm Detection\" 1")
