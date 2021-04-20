# Defined in - @ line 1
function cm --description 'alias cm git commit' --wraps 'git commit'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git commit $argv;
    else
        config commit $argv;
    end
end
