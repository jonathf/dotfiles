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

M.view_tag = function(idx)
  return function()
    local tag = root.tags()[idx]
    if tag then
      tag:view_only()
      awful.screen.focus(tag.screen)
    end
  end
end

M.move_client = function(idx)
  return function()
    if client.focus then
      local tag = awful.screen.focused().tags[idx]
      client.focus:move_to_tag(tag)
      tag:view_only()
    else
      local tag = root.tags()[idx]
      if tag then
        tag:view_only()
        awful.screen.focus(tag.screen)
      end
    end
  end
end

return M
