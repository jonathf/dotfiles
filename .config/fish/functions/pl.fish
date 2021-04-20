# Defined in - @ line 1
function pl --description 'alias pl git pull --rebase' --wraps 'git pull --rebase'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git pull --rebase $argv;
    else
        config pull --rebase $argv;
    end
end
