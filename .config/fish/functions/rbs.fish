# Defined in - @ line 1
function rbs --description 'alias rbs git rebase --skip' --wraps 'git rebase --skip'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git rebase --skip $argv;
    else
        config rebase --skip $argv;
    end
end
