# Defined in - @ line 1
function rba --description 'alias rba git rebase --abort' --wraps 'git rebase --abort'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git rebase --abort $argv;
    else
        config rebase --abort $argv;
    end
end
