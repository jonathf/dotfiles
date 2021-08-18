local naughty = require("naughty")

local notification = nil
local actions = {up="-inc 10", down="-dec 10", min="-set 1", max="-set 100", mute="toggle"}
local set_command = "xbacklight "
local get_command = "xbacklight -get"

local function volume(action)
  return function()
    assert(io.popen(set_command..actions[action], "r")):close()

    local file = assert(io.popen(get_command, "r"))
    local brightness = tonumber(string.format("%.0f", file:read("*all")))
    file:close()

    naughty.destroy(notification)
    notification = naughty.notify{text = string.format("Brightness: %d %%", brightness)}
  end
end

return volume
