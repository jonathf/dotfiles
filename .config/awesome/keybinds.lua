local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")

modkey = "Mod4"

globalkeys = awful.util.table.join(

    -- command keys
    awful.key({modkey}, "Return", function() awful.spawn(terminal) end),
    awful.key({modkey, "Control"}, "r", awesome.restart),
    awful.key({modkey, "Control"}, "q", awesome.quit),

    awful.key({modkey}, "v", function() awful.spawn("qutebrowser") end),
    awful.key({modkey}, "r", function() awful.spawn("rofi -show drun") end),
    awful.key({modkey}, "p", function() awful.spawn("fish -c rofipass") end),
    awful.key({modkey}, "i", function() awful.spawn("fish -c rofiinsert") end),
    awful.key({modkey, "Control"}, "l", function() awful.spawn("xtrlock") end),

    -- the 'j' key
    awful.key({modkey}, "j",
        function()
            awful.client.focus.byidx(1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({modkey, "Shift"}, "j",
        function() awful.client.swap.byidx(1) end),
    awful.key({modkey, "Control"}, "j",
        function() awful.screen.focus_relative( 1) end),
    awful.key({modkey, "Control", "Shift"}, "j",
        function() awful.tag.incncol(1) end),

    -- the 'k' key
    awful.key({modkey}, "k",
        function()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({modkey, "Shift"}, "k",
        function() awful.client.swap.byidx(-1) end),
    awful.key({modkey, "Control"}, "k",
        function() awful.screen.focus_relative(-1) end),
    awful.key({modkey, "Control", "Shift"}, "k",
        function() awful.tag.incncol(-1) end),

    -- the 'h' key
    awful.key({modkey,}, "h", awful.tag.viewprev),
    awful.key({modkey, "Control"}, "h",
        function() awful.tag.incmwfact(-0.05) end),
    awful.key({modkey, "Control", "Shift"}, "h",
        function() awful.tag.incnmaster(1) end),
    awful.key({modkey, "Shift"}, "h",
        function()
            if client.focus then
                local idx = awful.tag.getidx()-1
                if idx == 0 then idx = 9 end
                client.focus:move_to_tag(awful.screen.focused().tags[idx])
            end
            awful.tag.viewprev()
        end),

    -- the 'l' key
    awful.key({modkey}, "l", awful.tag.viewnext),
    awful.key({modkey, "Control"}, "l",
        function() awful.tag.incmwfact( 0.05) end),
    awful.key({modkey, "Control", "Shift"}, "l",
        function() awful.tag.incnmaster(-1) end),
    awful.key({modkey, "Shift"}, "l",
        function()
            if client.focus then
                local idx = awful.tag.getidx()+1
                if idx == 10 then idx = 1 end
                client.focus:move_to_tag(awful.screen.focused().tags[idx])
            end
            awful.tag.viewnext()
        end),

    -- the 'o' key
    awful.key({modkey,}, "o", function() awful.screen.focus_relative(1) end),
    awful.key({modkey, "Shift"}, "o", awful.client.movetoscreen),

   -- volume, brightness and print
   awful.key({}, "XF86AudioRaiseVolume", function()
           awful.util.spawn("amixer -D pulse sset Master 10%+ unmute") end),
   awful.key({}, "XF86AudioLowerVolume", function()
           awful.util.spawn("amixer -D pulse sset Master 10%- unmute") end),
   awful.key({modkey}, "F3", function()
           awful.util.spawn("amixer -D pulse sset Master 100% unmute") end),
   awful.key({modkey}, "F2", function()
           awful.util.spawn("amixer -D pulse sset Master 10% unmute") end),
   awful.key({}, "XF86AudioMute", function()
           awful.util.spawn("amixer -D pulse sset Master toggle") end),
   awful.key({}, "XF86MonBrightnessDown", function()
           awful.spawn.with_shell('xbacklight_sqrt -dec 2.5') end),
   awful.key({modkey}, "XF86MonBrightnessDown", function()
           awful.spawn.with_shell('xbacklight -set 0.1') end),
   awful.key({}, "XF86MonBrightnessUp", function()
           awful.spawn.with_shell('xbacklight_sqrt -inc 4') end),
   awful.key({modkey}, "XF86MonBrightnessUp", function()
           awful.spawn.with_shell('xbacklight -set 100') end),
   awful.key({modkey}, "F4", function()
           awful.util.spawn("bluetoothctl connect 4c:87:5d:2d:1b:99") end),
   awful.key({modkey}, "F7", function()
           awful.spawn.with_shell("xrandr --auto --output eDP1 --below HDMI1") end),
   awful.key({modkey}, "F8", function()
           awful.spawn.with_shell("nmcli connection up 'unifon'") end),
   awful.key({}, "Print", function()
           awful.util.spawn("scrot -e 'mv $f ~/tmp/screenshots/ 2>/dev/null'") end),

    -- the 'space' key
    awful.key({modkey}, "space", function()
        awful.layout.inc(1, awful.screen.focused(),
            awful.layout.layouts) end)
)

-- number keys:
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({modkey}, "#" .. i + 9, function()
            local tag = awful.screen.focused().tags[i]
            if tag then tag:view_only() end
        end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
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
   awful.button({}, 1, function(c) client.focus = c end)))

clientkeys = awful.util.table.join(
    awful.key({modkey}, "f", function(c) c.fullscreen = not c.fullscreen end),
    awful.key({modkey, "Control"}, "c", function(c) c:kill() end),
    awful.key({modkey, "Shift"}, "o", function(c) c.move_to_screen() end)
)
clientbuttons = awful.util.table.join(
    awful.button({}, 1, function(c) client.focus = c end))
