# Defined in - @ line 1
function s --description 'alias s git status' --wraps 'git status'
    git status --short --branch $argv;
end
