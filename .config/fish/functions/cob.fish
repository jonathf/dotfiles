# Defined in - @ line 1
function cob --description 'alias cob git checkout -b' --wraps 'git checkout -b'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git checkout -b $argv;
    else
        config checkout -b $argv;
    end
end
