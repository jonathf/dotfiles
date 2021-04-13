-------------------------------------------------
-- The Ultimate Volume Widget for Awesome Window Manager
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/volume-widget

-- @author Pavel Makhov
-- @copyright 2020 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local spawn = require("awful.spawn")
local gears = require("gears")
local beautiful = require("beautiful")
local watch = require("awful.widget.watch")


local main_color = "#5f819d"
local bg_color = '#ffffff11'
local mute_color = beautiful.fg_urgent
local mute_color = "#2d3c46"
local size = 22

local volume = {
    widget = wibox.widget {
        {
            id = "icon",
            image = os.getenv("HOME").."/.config/awesome/pics/volume_up_white_24dp.svg",
            resize = true,
            widget = wibox.widget.imagebox,
        },
        max_value = 100,
        thickness = 3,
        start_angle = 4.71238898, -- 2pi*3/4
        forced_height = size,
        forced_width = size,
        bg = bg_color,
        paddings = 2,
        widget = wibox.container.arcchart,
        set_volume_level = function(self, new_value) self.value = new_value end,
        mute = function(self) self.colors = { mute_color } end,
        unmute = function(self) self.colors = { main_color } end
    }
}


local function worker(user_args)

    local function update_graphic(widget, stdout)
        local mute = string.match(stdout, "%[(o%D%D?)%]")   -- \[(o\D\D?)\] - [on] or [off]
        if mute == 'off' then widget:mute()
        elseif mute == 'on' then widget:unmute()
        end
        local volume_level = string.match(stdout, "(%d?%d?%d)%%") -- (\d?\d?\d)\%)
        volume_level = string.format("% 3d", volume_level)
        widget:set_volume_level(volume_level)
    end

    function volume:inc(step)
        local inc_volume_cmd = 'amixer -D pulse sset Master '..step..'%+'
        spawn.easy_async(inc_volume_cmd, function(stdout) update_graphic(volume.widget, stdout) end)
    end

    function volume:dec(step)
        local dec_volume_cmd = 'amixer -D pulse sset Master '..step..'%-'
        spawn.easy_async(dec_volume_cmd, function(stdout) update_graphic(volume.widget, stdout) end)
    end

    function volume:toggle()
        spawn.easy_async('amixer -D pulse sset Master toggle', function(stdout) update_graphic(volume.widget, stdout) end)
    end

    watch('amixer -D pulse sget Master', 10, update_graphic, volume.widget)

    return volume.widget
end

return setmetatable(volume, { __call = function(_, ...) return worker(...) end })
