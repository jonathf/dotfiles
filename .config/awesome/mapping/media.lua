local awful = require("awful")

local utils = require("mapping.utils")

return awful.util.table.join(
  utils.key("   ", "XF86AudioRaiseVolume", utils.spawn("amixer -D pulse sset Master 10%+"),
    {group="media", description="volume up"}),
  utils.key("m  ", "XF86AudioRaiseVolume", utils.spawn("amixer -D pulse sset Master 100%"),
    {group="media", description="volume max"}),
  utils.key("   ", "XF86AudioLowerVolume", utils.spawn("amixer -D pulse sset Master 10%-"),
    {group="media", description="volume down"}),
  utils.key("m  ", "XF86AudioLowerVolume", utils.spawn("amixer -D pulse sset Master 100%"),
    {group="media", description="volume min"}),
  utils.key("   ", "XF86AudioMute", utils.spawn("amixer -D pulse sset Master toggle"),
    {group="media", description="volume mute"}),
  utils.key("   ", "XF86MonBrightnessDown", utils.spawn("xbacklight -dec 10"),
    {group="media", description="brightness down"}),
  utils.key("m  ", "XF86MonBrightnessDown", utils.spawn("xbacklight -dec 100"), 
    {group="media", description="brightness min"}),
  utils.key("   ", "XF86MonBrightnessUp", utils.spawn("xbacklight -inc 10"), 
    {group="media", description="brightness up"}),
  utils.key("m  ", "XF86MonBrightnessUp", utils.spawn("xbacklight -inc 100"), 
    {group="media", description="brightness max"}),
  utils.key("m  ", "F7", function() awful.utils.spawn.with_shell("xrandr --auto --output eDP1 --below HDMI1") end),
  utils.key("m  ", "F8", function() awful.utils.spawn.with_shell("nmcli connection up 'unifon'") end),
  utils.key("   ", "Print", utils.spawn("scrot -e 'mv $f ~/tmp/screenshots/ 2>/dev/null'"),
    {group="media", description="print screen"})
)

