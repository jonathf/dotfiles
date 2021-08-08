-- Network Widget for Awesome Window Manager
local naughty = require("naughty")
local construct = require("widgets.construct")

local last_ssid = ""
local function update_widget(widget, stdout)
  if not stdout:match("%*") then
    widget.value = 0
    widget.message = "Wifi: Disconnected"
    if last_ssid ~= "" then
      naughty.notify{text="Wifi: Disconnected"}
      last_ssid = ""
    end
  else
    local signal_str, ssid = stdout:match("%* +(%d+) +([ %w]+)")
    local signal = tonumber(signal_str)
    ssid = ssid:match(".*%S")
    widget.value = signal
    widget.message = string.format("Wifi: %s, %d %%", ssid, signal)
    if last_ssid ~= ssid then
      naughty.notify{text=widget.message}
      last_ssid = ssid
    end
  end
end

return function()
  return construct{
    command = "nmcli -f IN-USE,SIGNAL,SSID device wifi",
    update = update_widget,
    image = "pics/wifi_white_24dp.svg",
    colors = {"#5e8d87"},
  }
end
