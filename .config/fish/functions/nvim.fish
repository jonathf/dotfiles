# Defined in - @ line 1
function nvim --description 'alias nvim nvim' --wraps 'nvim'
    # for some reason 'nvim --version' is called during tab-completion of vi
    if test "$argv" = '--version'
        command nvim --version
    else if test -z "$NVIM_LISTEN_ADDRESS"
        command nvim $argv;
    else
        nvr $argv
    end
end
