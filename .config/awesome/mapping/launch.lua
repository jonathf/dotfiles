local awful = require "awful"
local hotkeys_popup = require "awful.hotkeys_popup"

local utils = require "mapping.utils"

return awful.util.table.join(
  utils.key("msc", "r", awesome.restart, {group="awesome", description="restart"}),
  utils.key("msc", "q", awesome.quit, {group="awesome", description="quit"}),
  utils.key("msc", "l", utils.spawn("xtrlock"), {group="awesome", description="lock"}),

  utils.key("m  ", "Return", utils.spawn("alacritty"),
    {group="launch", description="terminal"}),
  utils.key("m c", "Return", utils.spawn("alacritty --command bash --norc"),
    {group="launch", description="terminal"}),
  utils.key("m  ", "r", utils.spawn("drun"),
    {group="launch", description="program"}),
  utils.key("m  ", "p", utils.spawn("dpass"),
    {group="launch", description="password"}),
  utils.key("ms ", "p", utils.spawn("dpass_insert")),
  utils.key("m  ", "i", utils.spawn("dinsert"),
    {group="launch", description="insertion"}),
  utils.key("m  ", "w", utils.spawn("networkmanager_dmenu -c -bw 2 -fn \"Ubuntu Mono-14:normal\""),
    {group="launch", description="wifi"}),
  utils.key("m  ", "b", utils.spawn("dmenu-bluetooth"),
    {group="launch", description="bluetooth"}),
  utils.key("m  ", "s", hotkeys_popup.show_help,
    {group="launch", description="help"})
)
