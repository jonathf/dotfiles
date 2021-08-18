local naughty = require("naughty")

local notification = nil

local function xrandr()
  local file = assert(io.popen("xrandr", "r"))
  local stdout = file:read("*all")
  file:close()
  for match in string.gmatch(stdout, "(%w+) connected") do
    if match ~= "eDP1" then
      assert(io.popen("xrandr --output eDP1 --below "..match, "r")):close()

      naughty.destroy(notification)
      notification = naughty.notify{text = string.format("display: %s", match)}
    end
  end
end

return xrandr
