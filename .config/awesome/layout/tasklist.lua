local awful = require("awful")

local tasklist_buttons = awful.util.table.join(
    awful.button({}, 1, function(c)
        if c == client.focus then c.minimized = true
        else
            c.minimized = false
            if not c:isvisible() and c.first_tag then
                c.first_tag:view_only()
            end
            client.focus = c
            c:raise()
        end
    end)
)

local function make_tasklist(screen)
  return awful.widget.tasklist(
    screen,
    awful.widget.tasklist.filter.currenttags,
    tasklist_buttons,
    {tasklist_disable_icon=true, align="center"}
  )
end

return make_tasklist
