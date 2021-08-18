local awful = require("awful")

local utils = require"mapping.utils"

local volume = require"command.volume"
local brightness = require"command.brightness"
local xrandr = require"command.xrandr"

return awful.util.table.join(
  utils.key("   ", "XF86AudioRaiseVolume", volume("up"),
    {group="media", description="volume up"}),
  utils.key("m  ", "XF86AudioRaiseVolume", volume("max"),
    {group="media", description="volume max"}),
  utils.key("   ", "XF86AudioLowerVolume", volume("down"),
    {group="media", description="volume down"}),
  utils.key("m  ", "XF86AudioLowerVolume", volume("min"),
    {group="media", description="volume min"}),
  utils.key("   ", "XF86AudioMute", volume("mute"),
    {group="media", description="volume mute"}),
  utils.key("   ", "XF86MonBrightnessDown", brightness("down"),
    {group="media", description="brightness down"}),
  utils.key("m  ", "XF86MonBrightnessDown", brightness("min"),
    {group="media", description="brightness min"}),
  utils.key("   ", "XF86MonBrightnessUp", brightness("up"),
    {group="media", description="brightness up"}),
  utils.key("m  ", "XF86MonBrightnessUp", brightness("max"),
    {group="media", description="brightness max"}),
  utils.key("m  ", "F7", xrandr),
  utils.key("m  ", "F8", function() awful.utils.spawn.with_shell("nmcli connection up 'unifon'") end),
  utils.key("   ", "Print", utils.spawn("scrot -e 'mv $f ~/temp/screenshots/ 2>/dev/null'"),
    {group="media", description="print screen"})
)
