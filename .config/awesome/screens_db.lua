local naughty = require("naughty")

local defaultOutput = "eDP-1"

outputMapping = {
  ["DP-1"] = "DP-1",
  ["DP-2"] = "DP-2",
  ["DP-3"] = "DP-3",
  ["DP-4"] = "DP-4",
  ["HDMI-1"] = "HDMI-1",
  ["HDMI-2"] = "HDMI-2",
  ["HDMI-3"] = "HDMI-3",
  ["eDP-1"] = "eDP-1",
  ["eDP-2"] = "eDP-2",
  ["DVI-I-1-1"] = "DVI-I-1-1",
  ["DVI-I-2-2"] = "DVI-I-2-2",
  ["DVI-I-3-3"] = "DVI-I-3-3",
  ["DVI-I-4-4"] = "DVI-I-4-4",
}

screens = {
  ["default"] = {
    ["connected"] = function(xrandrOutput)
      if xrandrOutput ~= defaultOutput then
        return "--output " .. defaultOutput  .. " --primary --auto --output " .. xrandrOutput .. " --auto --below " .. defaultOutput
      end
      return nil
    end,
    ["disconnected"] = function(xrandrOutput)
      if xrandrOutput ~= defaultOutput then
        return "--output " .. xrandrOutput .. " --off --output " .. defaultOutput .. " --auto"
      end
      return nil
    end
  },
}
--  ["19000044"] = { -- /sys/class/drm/card0/card0-eDP-1
--    ["connected"] = function (xrandrOutput)
--      if xrandrOutput ~= defaultOutput then
--        return "--output " .. xrandrOutput .. " --auto --same-as " .. defaultOutput
--      end
--      return nil
--    end,
--    ["disconnected"] = function (xrandrOutput)
--      if xrandrOutput ~= defaultOutput then
--      return "--output " .. xrandrOutput .. " --off --output " .. defaultOutput .. " --auto"
--      end
--      return nil
--    end
--  }
--  ["9611115"] = { -- DVI-I-1
--    ["connected"] = function (xrandrOutput)
--      if xrandrOutput ~= defaultOutput then
--        return "--output " .. xrandrOutput .. " --auto --same-as " .. defaultOutput
--      end
--      return nil
--    end,
--    ["disconnected"] = function (xrandrOutput)
--      if xrandrOutput ~= defaultOutput then
--      return "--output " .. xrandrOutput .. " --off --output " .. defaultOutput .. " --auto"
--      end
--      return nil
--    end
--  }
