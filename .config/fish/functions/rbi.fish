# Defined in - @ line 1
function rbi --description 'alias rbi git rebase -i' --wraps 'git rebase -i'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git rebase -i $argv;
    else
        config rebase -i $argv;
    end
end
