local wibox = require("wibox")
local lain = require("lain")

local widgets = require("widgets")

local sep = wibox.widget.textbox(" ")
local clock = wibox.widget.textclock(lain.util.markup("#8c9440", "%a %d.%m %H:%M"))

local function make_taskbar(taglist, tasklist)
  local layout_left = wibox.layout.fixed.horizontal(
    sep, widgets.acpi(),
    sep, widgets.amixer(),
    sep, widgets.xbacklight(),
    sep, widgets.nmcli(),
    sep, wibox.widget.systray(),
    sep, taglist
  )
  local layout_right = wibox.layout.fixed.horizontal(sep, clock, sep)
  return wibox.layout.align.horizontal(
    layout_left, tasklist, layout_right)
end

return make_taskbar
