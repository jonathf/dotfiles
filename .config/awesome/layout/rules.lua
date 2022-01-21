local awful = require "awful"
local beautiful = require "beautiful"

awful.rules.rules = {
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = require"mapping".client,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
  }, {
    rule = {class = "plugin-container"},
    properties = {floating = true, focus = true}
  }, {
    rule = {class = "Plugin-container"},
    properties = {floating = true, focus = true}
  }, {
    rule = {class = "libreoffice"},
    properties = {floating = false, maximized = true, focus = true}
  }, {rule = {class = "mpv"}, properties = {fullscreen = true, focus = true}}
}
