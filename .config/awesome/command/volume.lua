local naughty = require("naughty")

local notification = nil
local actions = {up="10%+", down="10%-", min="10%", max="100%", mute="toggle"}
local set_command = "amixer -D pulse sset Master "
local get_command = "amixer -D pulse sget Master"

local function volume(action)
  return function()
    assert(io.popen(set_command..actions[action], "r")):close()

    local file = assert(io.popen(get_command, "r"))
    local stdout = file:read("*all")
    file:close()
    local is_mute = not stdout:find(" %[on%]")
    local volume_level = tonumber(string.match(stdout, "%[(%d?%d?%d)%%%]"))

    naughty.destroy(notification)
    if is_mute then
      notification = naughty.notify{text = "Volume: muted"}
    else
      notification = naughty.notify{text = string.format("Volume: %d %%", volume_level)}
    end
  end
end

return volume
