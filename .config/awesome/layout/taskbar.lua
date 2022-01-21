local wibox = require"wibox"
local widgets = require"widgets"

local sep = wibox.widget.textbox(" ")
local clock = wibox.widget.textclock"<span foreground=\"#8c9440\">%a %d.%m %H:%M</span>"

local function make_taskbar(taglist, tasklist)
  local layout_left = wibox.layout.fixed.horizontal(
    sep, widgets.battery,
    sep, widgets.volume,
    sep, widgets.brightness,
    sep, widgets.wifi,
    sep, wibox.widget.systray(),
    sep, taglist
  )
  local layout_right = wibox.layout.fixed.horizontal(sep, clock, sep)
  return wibox.layout.align.horizontal(layout_left, tasklist, layout_right)
end

return make_taskbar
