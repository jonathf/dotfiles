local awful = require "awful"

tasklist = require "layout.tasklist"
taglist = require "layout.taglist"
require "layout.signal"
require "layout.rules"

local function set_wallpaper(screen)
  require"gears".wallpaper.maximized(require"theme".wallpaper, screen, true)
end
-- reset wallpaper on each screen resize:
screen.connect_signal("property::geometry", set_wallpaper)

-- layout list:
awful.layout.layouts = {awful.layout.suit.max, awful.layout.suit.tile.left}

-- on connect of each new screen:
awful.screen.connect_for_each_screen(function(screen)

  set_wallpaper(screen)
  screen.taglist = taglist(screen)
  screen.tasklist = tasklist(screen)

  screen.mywibox = awful.wibar {position = "top", screen = screen}
  screen.mywibox:set_widget(require "layout.taskbar"(screen.taglist,
                                                     screen.tasklist))
end)
