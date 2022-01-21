local awful = require"awful"
local naughty = require"naughty"
local widgets = require"widgets"

local notification = nil
local actions = {up="-inc 10", down="-dec 10", min="-set 1", max="-set 100", mute="toggle"}
local set_command = "xbacklight "
local get_command = "xbacklight -get"


local function volume(action)
  return function()
    awful.spawn.easy_async(set_command..actions[action], function()
      awful.spawn.easy_async(get_command, function(stdout)

        local brightness = tonumber(string.format("%.0f", stdout))

        naughty.destroy(notification)
        notification = naughty.notify{
          text = string.format("Brightness: %d %%", brightness)}
        widgets.brightness.update()

      end)
    end)

  end
end

return volume
