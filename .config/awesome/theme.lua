local awful = require("awful")
config_path = awful.util.getdir("config")

theme = {}
theme.wallpaper = config_path .. "background.png"
theme.font = "Operator mono 10"

theme.bg_normal = "#00000000"
theme.fg_normal = "#425059"

theme.bg_focus = "#00000000"
theme.fg_focus = "#5f819d"

theme.bg_urgent = "#a54242"
theme.fg_urgent = "#c5c8c6"

theme.bg_minimize = "#5f819d"
theme.fg_minimize = "#2d3c46"

theme.bg_tooltip = "#000000"
theme.fg_tooltip = "#8c9440"

theme.bg_em = "#000000"
theme.fg_em = "#b294bb"

theme.bg_systray = "#00000000"
theme.useless_gap = 10

theme.border_width = "0"
theme.border_normal = "#425059"
theme.border_focus = "#5f819d"
theme.border_marked = "#91231c"

return theme
