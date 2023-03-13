local awful = require "awful"
local hotkeys_popup = require "awful.hotkeys_popup"

local utils = require "mapping.utils"

return awful.util.table.join(
  utils.key("m  ", "q", awesome.quit,                         {group="awesome", description="quit"}),
  utils.key("m  ", "w", utils.spawn(
    "networkmanager_dmenu -fn \"Ubuntu Mono-14:normal\""),    {group="launch", description="wifi"}),
  utils.key("m  ", "r", utils.spawn("drun"),                  {group="launch", description="program"}),
  utils.key("m  ", "t", utils.spawn("alacritty"),             {group="launch", description="terminal"}),
  utils.key("ms ", "t", utils.spawn("bash-fallback"),         {group="launch", description="bash-fallback"}),
  utils.key("m  ", "p", utils.spawn("dpass"),                 {group="launch", description="password"}),

  utils.key("m  ", "a", utils.spawn("dpass-username"),        {group="pass", description="type username"}),
  utils.key("m  ", "s", utils.spawn("dpass-password"),        {group="pass", description="type password"}),
  utils.key("m  ", "d", utils.spawn("dpass-domain"),          {group="pass", description="type domain"}),
  utils.key("ms ", "a", utils.spawn("dpass-username-clip"),   {group="pass", description="copy username"}),
  utils.key("ms ", "s", utils.spawn("dpass-password-clip"),   {group="pass", description="copy password"}),
  utils.key("ms ", "d", utils.spawn("dpass-domain-clip"),     {group="pass", description="copy domain"}),

  utils.key("m  ", "z", awesome.restart,                      {group="awesome", description="restart"}),
  utils.key("m  ", "x", utils.spawn("xtrlock"),               {group="awesome", description="lock"}),
  utils.key("m  ", "b", utils.spawn("dmenu-bluetooth"),
    {group="launch", description="bluetooth"}),
  utils.key("m  ", "?", hotkeys_popup.show_help,
    {group="launch", description="help"})
)
