local awful = require "awful"
local mapping = require "mapping"

-- Prevent clients from being unreachable after screen count changes.
client.connect_signal("manage", function(client)
  client:keys(mapping.clientkeys)
  client:buttons(awful.util.table.join(awful.button({}, 1, function(c)
    client.focus = c
  end)))
  if awesome.startup and not client.size_hints.user_position and
      not client.size_hints.program_position then awful.placement.no_offscreen(client) end
end)

client.connect_signal("focus", function(client) client.opacity = 1 end)
client.connect_signal("unfocus", function(client) client.opacity = 0.8 end)

client.connect_signal("mouse::enter", function(client)
    client:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
