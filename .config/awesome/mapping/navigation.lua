local awful = require "awful"
local utils = require "mapping.utils"
local gears = require "gears"

return awful.util.table.join(

  utils.key("m  ", "j",
    function()
      awful.client.focus.byidx(1)
      if client.focus then client.focus:raise() end
    end, {group="navigation", description="client"}),

  utils.key("m  ", "u", function() awful.client.swap.byidx(1) end,
    {group="navigation", description="CLIENT"}),

  utils.key("m  ", "k",
    function()
      awful.client.focus.byidx(-1)
      if client.focus then client.focus:raise() end
    end, {group="navigation", description="/client"}),

  utils.key("m  ", "i",
    function()
      awful.client.swap.byidx(-1)
    end, {group="navigation", description="/CLIENT"}),

  utils.key("m  ", "l", awful.tag.viewnext,
    {group="navigation", description="tag"}),

  utils.key("m  ", "o",
    function()
      if client.focus then
        local idx = awful.tag.getidx()
        idx = idx == 9 and 1 or idx+1
        local tag = awful.screen.focused().tags[idx]
        client.focus:move_to_tag(tag)
        tag:view_only()
      else
        awful.tag.viewnext()
      end
    end, {group="navigation", description="TAG"}),

  utils.key("m  ", "h", awful.tag.viewprev,
    {group="navigation", description="/tag"}),

  utils.key("m  ", "y",
    function()
      if client.focus then
        local idx = awful.tag.getidx()
        idx = idx == 1 and 9 or idx-1
        local tag = awful.screen.focused().tags[idx]
        client.focus:move_to_tag(tag)
        tag:view_only()
      else
        awful.tag.viewprev()
      end
    end, {group="navigation", description="/TAG"}),

  utils.key("m  ", "n", function() awful.screen.focus_relative(1) end, 
    {group="navigation", description="screen"}),

  utils.key("m  ", "m", function()
      local tag = awful.screen.focused().selected_tag
      local target = gears.math.cycle(screen:count(), awful.screen.focused().index + 1)
      if tag then
        tag.screen = target
        tag:view_only()
        awful.screen.focus(target)
        local i = 1
        for _, tag_ in pairs(root.tags()) do
          if tag_.screen.index == target then
            screen[target].tags[tag_.index].index = i
            i = i + 1
          end
        end
      end
    end,
    {group="navigation", description="SCREEN"}),

  utils.key("m  ", "space",
    function() awful.layout.inc(1, awful.screen.focused(), awful.layout.layouts) end,
    {group="navigation", description="layout"}),

  utils.key("m  ", "#10", utils.view_tag(1)),
  utils.key("m  ", "#11", utils.view_tag(2)),
  utils.key("m  ", "#12", utils.view_tag(3)),
  utils.key("m  ", "#13", utils.view_tag(4)),
  utils.key("m  ", "#14", utils.view_tag(5)),
  utils.key("m  ", "#15", utils.view_tag(6)),
  utils.key("m  ", "#16", utils.view_tag(7)),
  utils.key("m  ", "#17", utils.view_tag(8)),
  utils.key("m  ", "#18", utils.view_tag(9)),
  utils.key("ms ", "#10", utils.move_client(1)),
  utils.key("ms ", "#11", utils.move_client(2)),
  utils.key("ms ", "#12", utils.move_client(3)),
  utils.key("ms ", "#13", utils.move_client(4)),
  utils.key("ms ", "#14", utils.move_client(5)),
  utils.key("ms ", "#15", utils.move_client(6)),
  utils.key("ms ", "#16", utils.move_client(7)),
  utils.key("ms ", "#17", utils.move_client(8)),
  utils.key("ms ", "#18", utils.move_client(9))
)
