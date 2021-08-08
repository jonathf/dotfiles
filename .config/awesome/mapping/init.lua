local awful = require("awful")

require("awful.autofocus")

root.buttons(awful.util.table.join(
   awful.button({}, 1, function(c) client.focus = c end))
)

local M = {}

M.rootkeys = awful.util.table.join(
  require("mapping.navigation"),
  require("mapping.launch"),
  require("mapping.media")
)

M.clientkeys = require("mapping.client")

return M
