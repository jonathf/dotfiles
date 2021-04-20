# Defined in - @ line 1
function rb --description 'alias rb git rebase' --wraps 'git rebase'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git rebase $argv;
    else
        config rebase $argv;
    end
end
