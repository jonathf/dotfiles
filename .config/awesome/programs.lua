local awful = require("awful")

terminal = "alacritty"
terminal = "urxvt --meta8"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Window transparency
awful.spawn("nm-applet")
-- awful.spawn.once("xcompmgr -cF")
-- awful.spawn.once("compton -b")
awful.spawn.once("picom --experimental-backends")

-- Keyboard layout remap: capslock->escape, escape->F12
awful.spawn.once("setxkbmap -layout no")
awful.spawn.once("setxkbmap -option caps:escape")
awful.spawn.once("xmodmap -e \"keycode 9 = F12\"")

-- Applets
awful.spawn.once("blueman-applet")
awful.spawn.once("powerkit")
