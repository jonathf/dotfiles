-------------------------------------------------
-- Brightness Widget for Awesome Window Manager
-- Shows the brightness level of the laptop display
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/brightness-widget

-- @author Pavel Makhov
-- @copyright 2021 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local spawn = require("awful.spawn")
local naughty = require("naughty")

local get_brightness_cmd = 'xbacklight -get'
local inc_brightness_cmd = 'xbacklight -inc '
local dec_brightness_cmd = 'xbacklight -dec '
local timeout = 100

local brightness_widget = {}

local function worker(user_args)

    brightness_widget.widget = wibox.widget {
        {
            {
                image = os.getenv("HOME")..'/.config/awesome/pics/light_mode_white_24dp.svg',
                resize = true,
                widget = wibox.widget.imagebox,
            },
            valigh = 'center',
            layout = wibox.container.place
        },
        max_value = 100,
        thickness = 3,
        start_angle = 4.71238898, -- 2pi*3/4
        forced_height = 24,
        forced_width = 24,
        bg = bg_color,
        paddings = 2,
        colors = {"#9e824c"},
        widget = wibox.container.arcchart,
        set_value = function(self, level) self:set_value(level) end
    }

    local update_widget = function(widget, stdout, _, _, _)
        local brightness_level = tonumber(string.format("%.0f", stdout))
        widget:set_value(brightness_level)
    end

    function brightness_widget:inc(step)
        spawn.easy_async(inc_brightness_cmd..step, function()
            spawn.easy_async(get_brightness_cmd,
            function(out) update_widget(brightness_widget.widget, out) end)
        end)
    end
    function brightness_widget:dec(step)
        spawn.easy_async(dec_brightness_cmd..step, function()
            spawn.easy_async(get_brightness_cmd,
            function(out) update_widget(brightness_widget.widget, out) end)
        end)
    end

    brightness_widget.widget:buttons(
        awful.util.table.join(
            awful.button({}, 4, function() brightness_widget:inc(5) end),
            awful.button({}, 5, function() brightness_widget:dec(5) end)
        )
    )
    watch(get_brightness_cmd, timeout, update_widget, brightness_widget.widget)
    return brightness_widget.widget
end

return setmetatable(brightness_widget, { __call = function(_, ...)
    return worker(...)
end })
