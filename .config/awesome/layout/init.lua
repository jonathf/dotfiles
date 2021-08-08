local awful = require("awful")
local gears = require("gears")

local theme = require("theme")
local taskbar = require("layout.taskbar")
local set_taglist = require("layout.taglist")
local set_tasklist = require("layout.tasklist")

require("layout.signal")
require("layout.rules")


local function set_wallpaper(screen)
    gears.wallpaper.maximized(theme.wallpaper, screen, true)
end
-- reset wallpaper on each screen resize:
screen.connect_signal("property::geometry", set_wallpaper)

-- layout list:
awful.layout.layouts = {awful.layout.suit.max, awful.layout.suit.tile.left}

-- on connect of each new screen:
awful.screen.connect_for_each_screen(function(screen)
  set_wallpaper(screen)
  screen.taglist = set_taglist(screen)
  screen.tasklist = set_tasklist(screen)

  local layouts = taskbar(screen.taglist, screen.tasklist)
  screen.mywibox = awful.wibar{position="top", screen=screen}
  screen.mywibox:set_widget(layouts)
end)
