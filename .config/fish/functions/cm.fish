# Defined in - @ line 1
function cm --description 'alias cm git commit' --wraps 'git commit'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git commit $argv;
    else
        config commit $argv;
    end
end
