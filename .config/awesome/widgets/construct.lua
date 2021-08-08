local awful = require("awful")
local naughty = require("naughty")
local wibox = require("wibox")

--- Construct arc widget.
-------------------------------------------------------------------------------
-- @param command string: System command used to gather relevant widget values.
-- @param update function: Update widget based on command standard out.
-- @param image string: Path to widget icon relative to Awesome config root.
-- @param colors table: Set of default colors used in widget.
local function construct(args)
  local notification = nil
  local configuration = {
    {
      id = "icon",
      image = os.getenv("HOME").."/.config/awesome/"..args.image,
      resize = true,
      widget = wibox.widget.imagebox,
    },
    max_value = 100,
    thickness = 3,
    start_angle = 4.71238898, -- 2pi*3/4
    forced_height = 24,
    forced_width = 24,
    bg = "#ffffff11",
    paddings = 2,
    colors = args.colors,
    widget = wibox.container.arcchart,
  }
  local widget = wibox.widget(configuration)

  --- Produce output notification with command standard output.
  -----------------------------------------------------------------------------
  -- @param stdout string: Standard output from running command.
  local function create_notification(stdout)
    naughty.destroy(notification)
    notification = naughty.notify{text = widget.message}
  end

  --- Trigger notification on mouse click.
  -----------------------------------------------------------------------------
  local function button_press(_, _, _, button)
    if button == 1 then
      awful.spawn.easy_async("bash -c '"..args.command.."'", create_notification)
    end
  end

  widget:connect_signal("button::press", button_press)
  awful.widget.watch(args.command, 10, args.update, widget)
  return widget
end

return construct
