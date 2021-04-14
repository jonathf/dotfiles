# Defined in - @ line 1
function a --description 'alias a git add' --wraps 'git add'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git add $argv;
    else
        config add $argv;
    end
end
