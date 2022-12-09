local awful = require "awful"

local function create_taglist(screen)

  if screen.index == 1 then
    awful.tag(
      {'1', '2', '3', '4', '5', '6', 'Q', 'F', 'B'},
      screen,
      awful.layout.suit.max
    )
  else
    root.tags()[screen.index].screen = screen
    root.tags()[screen.index]:view_only()
  end

  return awful.widget.taglist{
    screen = screen,
    filter = awful.widget.taglist.filter.all,
    buttons = awful.util.table.join(
      awful.button({}, 1, function(tag) tag:view_only() end))
  }
end
return create_taglist
