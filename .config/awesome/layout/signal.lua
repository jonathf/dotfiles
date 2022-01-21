local awful = require"awful"
local mapping = require"mapping"

-- Prevent clients from being unreachable after screen count changes.
client.connect_signal("manage",
  function(c)
    c:keys(mapping.clientkeys)
    c:buttons(awful.util.table.join(
      awful.button({}, 1, function(c_) client.focus = c_ end)))
    if awesome.startup and not c.size_hints.user_position and
            not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
  end)

client.connect_signal("focus", function(c) c.opacity = 1 end)
client.connect_signal("unfocus", function(c) c.opacity = 0.5 end)
