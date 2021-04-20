# Defined in - @ line 1
function a --description 'alias a git add' --wraps 'git add'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git add $argv;
    else
        config add $argv;
    end
end
