--- Volume Arc Widget for Awesome Window Manager
--- Update widget based on command output.
-------------------------------------------------------------------------------
-- @param widget wibox.widget: Constructed widget.
-- @param stdout string: Standard output from running 'command'.
local function update_widget(widget, stdout)
  local is_mute = not stdout:find(" %[on%]")
  local volume_level = tonumber(string.match(stdout, "%[(%d?%d?%d)%%%]"))
  widget.value = volume_level
  widget.colors = {is_mute and "#2d3c46" or "#5f819d"}
  if is_mute then
    widget.message = "Muted"
  else
    widget.message = string.format("Volume: %d %%", volume_level)
  end
end

local widget = require "widgets.construct" {
  command = "amixer -D pulse sget Master",
  image = "pics/volume_up_white_24dp.svg",
  update = update_widget,
  frequency = 30
}
return widget
