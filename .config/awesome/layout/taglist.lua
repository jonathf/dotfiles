local awful = require"awful"


local function create_taglist(screen)

  awful.tag({'1', '2', '3', '4', '5', '6', '7', '8', '9'},
            screen, awful.layout.suit.max)

  local taglist_buttons = awful.util.table.join(
      awful.button({}, 1, function(t) t:view_only() end))

  return awful.widget.taglist(
    screen, awful.widget.taglist.filter.noempty, taglist_buttons)
end
return create_taglist
