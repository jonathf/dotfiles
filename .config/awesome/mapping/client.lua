local awful = require "awful"

local utils = require "mapping.utils"


return awful.util.table.join(
  utils.key("m  ", "f", function(client)
    client.fullscreen = not client.fullscreen end,            {group="awesome", description="toggle fullscreen"}),

  utils.key("m  ", "c", function(client) client:kill() end,   {group="awesome", description="kill application"})
)
