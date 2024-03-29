--- Brightness Arc Widget
--- Update widget based on command output.
-------------------------------------------------------------------------------
-- @param widget wibox.widget: Constructed widget.
-- @param stdout string: Standard output from running 'command'.
local function update_widget(widget, stdout)
  local brightness_level = tonumber(string.format("%.0f", stdout))
  widget.value = brightness_level
  widget.message = string.format("Brightness: %d %%", brightness_level)
end

local widget = require "widgets.construct" {
  command = "xbacklight -get",
  update = update_widget,
  image = "pics/light_mode_white_24dp.svg",
  colors = {"#9e824c"},
  frequency = 30
}
return widget
