require "error-handling"
require "layout"
root.keys(require "mapping" .rootkeys)
require "beautiful".init(require "theme")

local spawn = require "awful" .util.spawn_with_shell
spawn(os.getenv("HOME") .. "/.local/bin/dpass-update &")
spawn "xcompmgr -cF &"
