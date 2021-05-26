-------------------------------------------------
-- Battery Arc Widget for Awesome Window Manager
-- Shows the battery level of the laptop
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/batteryarc-widget

-- @author Pavel Makhov
-- @copyright 2020 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
local wibox = require("wibox")
local watch = require("awful.widget.watch")

local HOME = os.getenv("HOME")

local timeout = 10

local main_color = "#8c9440"
local bg_color = '#ffffff11'
local low_level_color = '#e53935'
local medium_level_color = '#c0ca33'
local charging_color = "#2d3c46"

local warning_msg_title = 'Houston, we have a problem'
local warning_msg_text = 'Battery is dying'
local warning_msg_position = 'bottom_right'

local batteryarc_widget = {}


local function worker(user_args)

    batteryarc_widget = wibox.widget {
        {
            id = "icon",
            image = os.getenv("HOME").."/.config/awesome/pics/bolt_white_24dp.svg",
            resize = true,
            widget = wibox.widget.imagebox,
        },
        max_value = 100,
        rounded_edge = true,
        thickness = 3,
        start_angle = 4.71238898, -- 2pi*3/4
        forced_height = 24,
        forced_width = 24,
        bg = bg_color,
        paddings = 2,
        widget = wibox.container.arcchart,
        charging = function(self) self.colors = { charging_color } end,
        discharging = function(self) self.colors = { main_color } end
    }

    local last_battery_check = os.time()

    --[[ Show warning notification ]]
    local function show_battery_warning()
        naughty.notify {
            text = warning_msg_text,
            title = warning_msg_title,
            timeout = 25, -- show the warning for a longer time
            hover_timeout = 0.5,
            position = warning_msg_position,
            bg = "#F06060",
            fg = "#EEE9EF",
            width = 300,
        }
    end

    local function update_widget(widget, stdout)
        local charge = 0
        local status
        for s in stdout:gmatch("[^\r\n]+") do
            local cur_status, charge_str, _ = string.match(s, '.+: (%a+), (%d?%d?%d)%%,?(.*)')
            if cur_status ~= nil and charge_str ~=nil then
                local cur_charge = tonumber(charge_str)
                if cur_charge > charge then
                    status = cur_status
                    charge = cur_charge
                end
            end
        end

        widget.value = charge

        if status ~= 'Charging' then
            widget.colors = { charging_color }
        end

        if charge < 15 then
            widget.colors = { low_level_color }
            if status ~= 'Charging' and os.difftime(os.time(), last_battery_check) > 300 then
                -- if 5 minutes have elapsed since the last warning
                last_battery_check = os.time()

                show_battery_warning()
            end
        elseif charge > 15 and charge < 40 then
            widget.colors = { medium_level_color }
        else
            widget.colors = { main_color }
        end
    end

    watch("acpi", timeout, update_widget, batteryarc_widget)

    -- Popup with battery info
    local notification
    local function show_battery_status()
        awful.spawn.easy_async([[bash -c 'acpi']],
                function(stdout, _, _, _)
                    naughty.destroy(notification)
                    notification = naughty.notify {
                        text = stdout,
                        title = "Battery status",
                        timeout = 5,
                        width = 200,
                    }
                end)
    end

    batteryarc_widget:connect_signal('button::press', function(_, _, _, button)
        if (button == 1) then show_battery_status() end
    end)

    return batteryarc_widget

end

return setmetatable(batteryarc_widget, { __call = function(_, ...)
    return worker(...)
end })
