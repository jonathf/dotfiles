local awful = require "awful"
local naughty = require "naughty"

local notification = nil

local function xrandr()
  awful.spawn.easy_async("xrandr", function(stdout)
    for adapter, resolution in string.gmatch(stdout,
                                             "(%w+) connected .*\n   (%d+x%d+)") do
      if adapter ~= "eDP1" then

        awful.spawn.easy_async("xrandr --output eDP1 --below " .. adapter)
        naughty.destroy(notification)
        notification = naughty.notify {
          text = string.format("display: %s [%d]", adapter, resolution)
        }
      end
    end
  end)
end

return xrandr
