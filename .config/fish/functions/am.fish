# Defined in - @ line 1
function am --description 'alias am am' --wraps 'git commit --amend'
    $HOME/.local/bin/am
end
