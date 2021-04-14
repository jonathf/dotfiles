# Defined in - @ line 1
function ps --description 'alias ps git push' --wraps 'git push'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git push $argv;
    else
        config push $argv;
    end
end
