# Defined in - @ line 1
function pst --description 'alias pst git push --tags' --wraps 'git push --tags'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git push --tags --force-with-lease $argv;
    else
        config push --tags --force-with-lease $argv;
    end
end
