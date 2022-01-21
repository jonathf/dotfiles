-- Battery Arc Widget for Awesome Window Manager

--- Update widget based on command output.
-------------------------------------------------------------------------------
-- @param widget wibox.widget: Constructed widget.
-- @param stdout string: Standard output from running 'command'.
local function update_widget(widget, stdout)
  local status, charge_str = stdout:match(".+: (%a+), (%d?%d?%d)%%,?")
  local charge = tonumber(charge_str)
  widget.value = charge
  widget.message = string.format("%s: %d %%", status, charge)
  if status ~= "Discharging" then
    widget.colors = {"#ffffff"}
  elseif charge < 10 then
    widget.colors = {"#e53935"}
    require"naughty".notify{text = widget.message}
  else
    widget.colors = {"#8c9440"}
  end
end

local widget = require"widgets.construct"{
  command = "acpi",
  image = "pics/bolt_white_24dp.svg",
  update = update_widget,
  frequency = 30,
}
return widget
