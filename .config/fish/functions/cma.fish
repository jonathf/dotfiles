# Defined in - @ line 1
function cma --wraps='git commit -a' --description 'alias cma git commit -a'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git commit -a $argv;
    else
        config commit -a $argv;
    end
end
