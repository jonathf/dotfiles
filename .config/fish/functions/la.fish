# Defined in - @ line 1
function la --description 'alias la exa -a' --wraps 'exa -a'
    exa -a $argv;
end
