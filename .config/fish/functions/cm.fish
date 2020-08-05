# Defined in - @ line 1
function cm --description 'alias cm git commit' --wraps 'git commit'
    $HOME/.local/bin/cm $argv;
end
