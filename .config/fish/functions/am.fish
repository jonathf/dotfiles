# Defined in - @ line 1
function am --description 'alias am git commit --amend' --wraps 'git commit --amend'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git commit --amend $argv;
    else
        config commit --amend $argv;
    end
end
