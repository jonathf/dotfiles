local awful = require"awful"
local utils = require"mapping.utils"

local command = require"command"

return awful.util.table.join(
  utils.key("   ", "XF86AudioRaiseVolume", command.volume("up"),
    {group="media", description="volume up"}),
  utils.key("m  ", "XF86AudioRaiseVolume", command.volume("max"),
    {group="media", description="volume max"}),
  utils.key("   ", "XF86AudioLowerVolume", command.volume("down"),
    {group="media", description="volume down"}),
  utils.key("m  ", "XF86AudioLowerVolume", command.volume("min"),
    {group="media", description="volume min"}),
  utils.key("   ", "XF86AudioMute", command.volume("mute"),
    {group="media", description="volume mute"}),
  utils.key("   ", "XF86MonBrightnessDown", command.brightness("down"),
    {group="media", description="brightness down"}),
  utils.key("m  ", "XF86MonBrightnessDown", command.brightness("min"),
    {group="media", description="brightness min"}),
  utils.key("   ", "XF86MonBrightnessUp", command.brightness("up"),
    {group="media", description="brightness up"}),
  utils.key("m  ", "XF86MonBrightnessUp", command.brightness("max"),
    {group="media", description="brightness max"}),
  utils.key("m  ", "F7", command.xrandr),
  utils.key("m  ", "F8", utils.spawn("nmcli connection up 'unifon'")),
  utils.key("   ", "Print", utils.spawn("scrot -e 'mv $f ~/temp/screenshots/ 2>/dev/null'"),
    {group="media", description="print screen"})
)
