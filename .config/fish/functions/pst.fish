# Defined in - @ line 1
function pst --description 'alias pst git push --tags' --wraps 'git push --tags'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git push --tags --force-with-lease $argv;
    else
        config push --tags --force-with-lease $argv;
end
