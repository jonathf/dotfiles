#
# Wrap the builtin cd command to maintain directory history.
#
function cd --description "Change directory"
    set -l MAX_DIR_HIST 25

    if test (count $argv) -gt 1
        printf "%s\n" (_ "Too many args for cd command")
        return 1
    end

    if test ! -d "$argv" -a "$argv" != "-" -a -n "$argv"
      set matches "$argv"*/
      if test (count $matches) = 1
        echo -n "'$argv' not found; expanding to '$matches[1]'"
        set argv $matches[1]
      else if test (count $matches) = 0
        echo "'$argv' not found; no matches"
        return 1
      else
        echo "'$argv' ambiguous: $matches"
        return 1
      end
    end

    # Skip history in subshells.
    if status --is-command-substitution
        builtin cd $argv
        return $status
    end

    # make nvim aware of cd
    if test -n "$NVIM"
        ~/.venv/nvim/312/bin/python -c "
import neovim
with neovim.attach('socket', path='$NVIM') as session:
    session.vars['__autocd_cwd'] = '$argv'
    session.command('execute \"lcd \" . fnameescape(g:__autocd_cwd)')"
    end

    # Skip history when going home.
    if test -z "$argv"
        set argv "$HOME"
    end

    # Avoid set completions.
    set -l previous $PWD

    # Let - jump back in history
    if test "$argv" = "-"
        if test "$__fish_cd_direction" = "next"
            nextd
        else
            prevd
        end
        return $status
    end

    # Jump to home folder is not stored in history
    if test (realpath $argv) = "$HOME"
        builtin cd $argv
        return $status
    end

    # allow explicit "cd ." if the mount-point became stale in the meantime
    if test "$argv" = "."
        builtin cd "$PWD"
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
