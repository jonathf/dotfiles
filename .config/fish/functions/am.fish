# Defined in - @ line 1
function am --description 'alias am git commit --amend' --wraps 'git commit --amend'
    git commit --amend $argv;
end
