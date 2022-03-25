local awful = require "awful"
local naughty = require "naughty"

local notification = nil

local function xrandr()
  awful.spawn.easy_async("xrandr", function(stdout)
    local text = ""
    for adapter, resolution, loaded in string.gmatch(
        stdout, "(%w+) connected [^\n]+\n%s+(%d+x%d+)i?%s+%d+%.%d+([* ])") do

      if adapter ~= "eDP1" then
        if loaded ~= "*" then
          awful.spawn.easy_async("xrandr --output " .. adapter .. " --mode " .. resolution, function()
            awful.spawn.easy_async("xrandr --output eDP1 --below " .. adapter)
          end)
        end
      end
      text = text .. string.format("%s: %s ", adapter, resolution)

    end
    naughty.destroy(notification)
    notification = naughty.notify{text = text}
  end)
end

return xrandr
