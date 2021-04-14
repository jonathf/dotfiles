local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")

local brightness_widget = require("widgets.brightness")
local volume_widget = require("widgets.volume")

nop = {}
mod = {"Mod4"}
mod_ctrl = {"Mod4", "Control"}
mod_shift = {"Mod4", "Shift"}
mod_shift_ctrl = {"Mod4", "Shift", "Control"}


globalkeys = awful.util.table.join(

    -- command keys
    awful.key(mod, "Return", function() awful.spawn(terminal) end),
    awful.key(mod_ctrl, "r", awesome.restart),
    awful.key(mod_ctrl, "q", awesome.quit),

    awful.key(mod, "v", function() awful.spawn("qutebrowser") end),
    awful.key(mod, "r", function() awful.spawn("drun") end),
    awful.key(mod, "p", function() awful.spawn("dpass") end),
    awful.key(mod_shift, "p", function() awful.spawn("dpass_insert") end),
    awful.key(mod, "i", function() awful.spawn("dinsert") end),
    awful.key(mod_ctrl, "l", function() awful.spawn("xtrlock") end),

    -- the 'j' key
    awful.key(mod, "j",
        function()
            awful.client.focus.byidx(1)
            if client.focus then client.focus:raise() end
        end),
    awful.key(mod_shift, "j", function() awful.client.swap.byidx(1) end),
    awful.key(mod_ctrl, "j", function() awful.screen.focus_relative( 1) end),
    awful.key(mod_shift_ctrl, "j", function() awful.tag.incncol(1) end),

    -- the 'k' key
    awful.key(mod, "k",
        function()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key(mod_shift, "k", function() awful.client.swap.byidx(-1) end),
    awful.key(mod_ctrl, "k", function() awful.screen.focus_relative(-1) end),
    awful.key(mod_shift_ctrl, "k", function() awful.tag.incncol(-1) end),

    -- the 'h' key
    awful.key(mod, "h", awful.tag.viewprev),
    awful.key(mod_ctrl, "h", function() awful.tag.incmwfact(-0.05) end),
    awful.key(mod_shift_ctrl, "h", function() awful.tag.incnmaster(1) end),
    awful.key(mod_shift, "h",
        function()
            if client.focus then
                local idx = awful.tag.getidx()-1
                if idx == 0 then idx = 9 end
                client.focus:move_to_tag(awful.screen.focused().tags[idx])
            end
            awful.tag.viewprev()
        end),

    -- the 'l' key
    awful.key(mod, "l", awful.tag.viewnext),
    awful.key(mod_ctrl, "l", function() awful.tag.incmwfact( 0.05) end),
    awful.key(mod_shift_ctrl, "l", function() awful.tag.incnmaster(-1) end),
    awful.key(mod_shift, "l",
        function()
            if client.focus then
                local idx = awful.tag.getidx()+1
                if idx == 10 then idx = 1 end
                client.focus:move_to_tag(awful.screen.focused().tags[idx])
            end
            awful.tag.viewnext()
        end),

    -- the 'o' key
    awful.key(mod, "o", function() awful.screen.focus_relative(1) end),
    awful.key(mod_shift, "o", awful.client.movetoscreen),

   -- volume, brightness and print
   awful.key(nop, "XF86AudioRaiseVolume", function() volume_widget:inc(5) end),
   awful.key(mod, "XF86AudioRaiseVolume", function() volume_widget:inc(100) end),
   awful.key(nop, "XF86AudioLowerVolume", function() volume_widget:dec(5) end),
   awful.key(mod, "XF86AudioLowerVolume", function() volume_widget:dec(100) end),
   awful.key(nop, "XF86AudioMute", function() volume_widget:toggle() end),
   awful.key(nop, "XF86MonBrightnessDown", function() brightness_widget:dec(5) end),
   awful.key(mod, "XF86MonBrightnessDown", function() brightness_widget:dec(100) end),
   awful.key(nop, "XF86MonBrightnessUp", function() brightness_widget:inc(5) end),
   awful.key(mod, "XF86MonBrightnessUp", function() brightness_widget:inc(100) end),
   awful.key(mod, "F4", function() awful.util.spawn("bluetoothctl connect 4c:87:5d:2d:1b:99") end),
   awful.key(mod, "F7", function() awful.spawn.with_shell("xrandr --auto --output eDP1 --below HDMI1") end),
   awful.key(mod, "F8", function() awful.spawn.with_shell("nmcli connection up 'unifon'") end),
   awful.key(nop, "Print", function() awful.util.spawn("scrot -e 'mv $f ~/tmp/screenshots/ 2>/dev/null'") end),

    -- the 'space' key
    awful.key(mod, "space", function() awful.layout.inc(1, awful.screen.focused(), awful.layout.layouts) end)
)

-- number keys:
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key(mod, "#" .. i + 9, function()
            local tag = awful.screen.focused().tags[i]
            if tag then tag:view_only() end
        end),
        awful.key(mod_shift, "#" .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then client.focus:move_to_tag(tag) end
            end
            local tag = awful.screen.focused().tags[i]
            if tag then tag:view_only() end
        end)
    )
end
root.keys(globalkeys)
root.buttons(awful.util.table.join(
   awful.button(nop, 1, function(c) client.focus = c end))
)
clientkeys = awful.util.table.join(
   awful.key(mod, "f", function(c) c.fullscreen = not c.fullscreen end),
   awful.key(mod_ctrl, "c", function(c) c:kill() end),
   awful.key(mod_shift, "o", function(c) c.move_to_screen() end)
)
clientbuttons = awful.util.table.join(
   awful.button(nop, 1, function(c) client.focus = c end)
)
