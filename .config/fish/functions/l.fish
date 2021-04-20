# Defined in - @ line 1
function l --description 'alias l git graph -20' --wraps 'git graph -20'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git --no-pager graph -20 $argv;
    else
        config --no-pager graph -20 $argv;
    end
end
