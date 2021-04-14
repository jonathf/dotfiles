# Defined in - @ line 1
function l --description 'alias l git graph -20' --wraps 'git graph -20'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git --no-pager graph -20 $argv;
    else
        config --no-pager graph -20 $argv;
    end
end
