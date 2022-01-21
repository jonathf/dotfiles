local naughty = require "naughty"

local in_error = false
local notify = function(text)
  if in_error then return end
  in_error = true
  naughty.notify {preset = naughty.config.presets.critical, text = text}
  in_error = false
end

if awesome.startup_errors then notify(awesome.startup_errors) end
awesome.connect_signal("debug::error", notify)
