local awful = require"awful"

local utils = require"mapping.utils"


return awful.util.table.join(
  utils.key("m  ", "f", function(client) client.fullscreen = not client.fullscreen end),
  utils.key("m c", "c", function(client) client:kill() end),
  utils.key("ms ", "o", function(client) client.move_to_screen() end)
)
