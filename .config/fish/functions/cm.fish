# Defined in - @ line 1
function cm --description 'alias cm git commit' --wraps 'git commit -f'
    $HOME/.local/bin/cm $argv;
end
