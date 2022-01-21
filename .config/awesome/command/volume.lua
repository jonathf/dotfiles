local awful = require "awful"
local naughty = require "naughty"
local widgets = require "widgets"

local notification = nil
local actions = {
  up = "10%+",
  down = "10%-",
  min = "10%",
  max = "100%",
  mute = "toggle"
}
local set_command = "amixer -D pulse sset Master "
local get_command = "amixer -D pulse sget Master"

local function volume(action)
  return function()
    awful.spawn.easy_async(set_command .. actions[action], function()
      awful.spawn.easy_async(get_command, function(stdout)

        local is_mute = not stdout:find(" %[on%]")
        local volume_level = tonumber(string.match(stdout, "%[(%d?%d?%d)%%%]"))

        naughty.destroy(notification)
        if is_mute then
          notification = naughty.notify {text = "Volume: muted"}
        else
          notification = naughty.notify {
            text = string.format("Volume: %d %%", volume_level)
          }
        end
        widgets.volume.update()

      end)
    end)

  end
end

return volume
