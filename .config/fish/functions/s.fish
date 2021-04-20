# Defined in - @ line 1
function s --description 'alias s git status' --wraps 'git status'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git status --short --branch $argv;
    else
        config status --short --branch $argv;
    end
end
