# Defined in - @ line 1
function co --description 'alias co git checkout' --wraps 'git checkout'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git checkout $argv;
    else
        config checkout $argv;
    end
end
