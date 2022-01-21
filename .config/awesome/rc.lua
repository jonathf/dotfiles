require"error-handling"
require"awful".util.spawn_with_shell"xcompmgr -cF &"
require"layout"
root.keys(require"mapping".rootkeys)
require"beautiful".init(require"theme")
