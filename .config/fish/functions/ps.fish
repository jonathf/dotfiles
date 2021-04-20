# Defined in - @ line 1
function ps --description 'alias ps git push' --wraps 'git push'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git push $argv;
    else
        config push $argv;
    end
end
