# Defined in - @ line 1
function cma --wraps='git commit -a' --description 'alias cma git commit -a'
    git commit -a $argv;
end
