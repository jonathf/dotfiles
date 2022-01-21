local awful = require "awful"
local utils = require "mapping.utils"

return awful.util.table.join(

  utils.key("m  ", "j",
    function()
      awful.client.focus.byidx(1)
      if client.focus then client.focus:raise() end
    end, {group="navigation", description="move next client"}),

  utils.key("ms ", "j", function() awful.client.swap.byidx(1) end, 
    {group="navigation", description="swap next client"}),

  utils.key("m  ", "k",
    function()
      awful.client.focus.byidx(-1)
      if client.focus then client.focus:raise() end
    end, {group="navigation", description="move previous client"}),

  utils.key("ms ", "k",
    function()
      awful.client.swap.byidx(-1)
    end, {group="navigation", description="swap previous client"}),

  utils.key("m  ", "h", awful.tag.viewprev,
    {group="navigation", description="move next tag"}),

  utils.key("ms ", "h",
    function()
      if client.focus then
        local idx = awful.tag.getidx()
        idx = idx == 1 and 9 or idx-1
        client.focus:move_to_tag(awful.screen.focused().tags[idx])
      end
      awful.tag.viewprev()
    end, {group="navigation", description="swap next tag"}),

  utils.key("m  ", "l", awful.tag.viewnext,
    {group="navigation", description="swap next tag"}),

  utils.key("ms ", "l",
    function()
      if client.focus then
        local idx = awful.tag.getidx()
        idx = idx == 9 and 1 or idx+1
        client.focus:move_to_tag(awful.screen.focused().tags[idx])
      end
      awful.tag.viewnext()
    end, {group="navigation", description="swap previous tag"}),

  utils.key("m  ", "o", function() awful.screen.focus_relative(1) end, 
    {group="navigation", description="move next screen"}),

  utils.key("ms ", "o", awful.client.movetoscreen,
    {group="navigation", description="swap next screen"}),

  utils.key("m  ", "space",
    function() awful.layout.inc(1, awful.screen.focused(), awful.layout.layouts) end,
    {group="navigation", description="swap next screen"}),

  utils.key("m  ", "#10", utils.move_screen(1)),
  utils.key("m  ", "#11", utils.move_screen(2)),
  utils.key("m  ", "#12", utils.move_screen(3)),
  utils.key("m  ", "#13", utils.move_screen(4)),
  utils.key("m  ", "#14", utils.move_screen(5)),
  utils.key("m  ", "#15", utils.move_screen(6)),
  utils.key("m  ", "#16", utils.move_screen(7)),
  utils.key("m  ", "#17", utils.move_screen(8)),
  utils.key("m  ", "#18", utils.move_screen(9)),
  utils.key("ms ", "#10", utils.swap_screen(1)),
  utils.key("ms ", "#11", utils.swap_screen(2)),
  utils.key("ms ", "#12", utils.swap_screen(3)),
  utils.key("ms ", "#13", utils.swap_screen(4)),
  utils.key("ms ", "#14", utils.swap_screen(5)),
  utils.key("ms ", "#15", utils.swap_screen(6)),
  utils.key("ms ", "#16", utils.swap_screen(7)),
  utils.key("ms ", "#17", utils.swap_screen(8)),
  utils.key("ms ", "#18", utils.swap_screen(9))
)
