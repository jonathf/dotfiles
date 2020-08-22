#
# Wrap the builtin cd command to maintain directory history.
#
function cd --description "Change directory"
    set -l MAX_DIR_HIST 25

    # make nvim aware of cd
    if test -n "$NVIM_LISTEN_ADDRESS"
        python -c "
import neovim
with neovim.attach('socket', path='$NVIM_LISTEN_ADDRESS') as session:
    session.vars['__autocd_cwd'] = '$argv'
    session.command('execute \"lcd \" . fnameescape(g:__autocd_cwd)')"
    end

    if test (count $argv) -gt 1
        printf "%s\n" (_ "Too many args for cd command")
        return 1
    end

    # Skip history in subshells.
    if status --is-command-substitution
        builtin cd $argv
        return $status
    end

    # Avoid set completions.
    set -l previous $PWD

    if test "$argv" = "-"
        if test "$__fish_cd_direction" = "next"
            nextd
        else
            prevd
        end
        return $status
    end

    # allow explicit "cd ." if the mount-point became stale in the meantime
    if test "$argv" = "."
        cd "$PWD"
        return $status
    end

    builtin cd $argv
    set -l cd_status $status

    if test $cd_status -eq 0 -a "$PWD" != "$previous"
        set -q dirprev
        or set -l dirprev
        set -q dirprev[$MAX_DIR_HIST]
        and set -e dirprev[1]
        set -g -a dirprev $previous
        set -e dirnext
        set -g __fish_cd_direction prev
    end

    return $cd_status
end
