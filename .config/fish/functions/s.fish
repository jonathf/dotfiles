# Defined in - @ line 1
function s --description 'alias s git status' --wraps 'git status'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git status --short --branch $argv;
    else
        config status --short --branch $argv;
    end
end
