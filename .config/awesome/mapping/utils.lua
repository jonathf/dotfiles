local awful = require "awful"

local M = {}

M.modifiers = {
  ["   "] = {},
  ["m  "] = {"Mod4"},
  ["ms "] = {"Mod4", "Shift"},
  ["msc"] = {"Mod4", "Shift", "Control"},
  ["m c"] = {"Mod4", "Control"}
}

M.spawn = function(command, idx)
  local tag = awful.screen.focused().tags[idx]
  return function()
    if tag then tag:view_only() end
    awful.spawn(command)
  end
end

M.key = function(mod, ...) return awful.key(M.modifiers[mod], ...) end

M.move_screen = function(idx)
  return function()
    local tag = awful.screen.focused().tags[idx]
    if tag then tag:view_only() end
  end
end

M.swap_screen = function(idx)
  return function()
    if client.focus then
      local tag = client.focus.screen.tags[idx]
      if tag then client.focus:move_to_tag(tag) end
    end
    local tag = awful.screen.focused().tags[idx]
    if tag then tag:view_only() end
  end
end

return M
