# Defined in - @ line 1
function cma --wraps='git commit -a' --description 'alias cma git commit -a'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git commit -a $argv;
    else
        config commit -a $argv;
    end
end
