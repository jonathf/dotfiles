local awful = require "awful"
local naughty = require "naughty"

local notification = nil

local function xrandr()
  awful.spawn.easy_async("xrandr", function(stdout)
    local text = ""
    local previous_adapter = ""
    for adapter, resolution, loaded in string.gmatch(
        stdout, "([-%w]+) connected [^\n]+\n%s+(%d+x%d+)i?%s+%d+%.%d+([* ])") do

      text = text .. string.format("\n%s: %s%s", adapter, resolution, loaded)
      if adapter ~= "eDP-1" then
        awful.spawn.easy_async("xrandr --output eDP-1 --mode 2160x1350", function()
          awful.spawn.easy_async("xrandr --output " .. adapter .. " --mode" .. resolution, function()
            awful.spawn.easy_async("xrandr --output eDP-1 --below " .. adapter, function() end)
          end)
        end)
        break
      end
    end
    naughty.destroy(notification)
    notification = naughty.notify{text = text:sub(2, #text)}
  end)
end

return xrandr
