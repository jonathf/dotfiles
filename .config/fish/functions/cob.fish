# Defined in - @ line 1
function cob --description 'alias cob git checkout -b' --wraps 'git checkout -b'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git checkout -b $argv;
    else
        config checkout -b $argv;
    end
end
