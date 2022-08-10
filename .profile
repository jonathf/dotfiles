export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR="0"
export XDG_CURRENT_DESKTOP="XFCE"
export XDG_CONFIG_DIRS="/etc/xdg"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export BROWSER="qutebrowser"
export DIRENV_LOG_FORMAT=""
export EDITOR="nvim"
export LANG="en_US.UTF-8"
export LANGUAGE="en"
export LC_ALL="en_US.UTF-8"
export LC_MESSAGES="C"
export PASSWORD_STORE_GENERATED_LENGTH="30"
export PIPENV_DEFAULT_PYTHON_VERSION="3.9"
export PIPENV_IGNORE_VIRTUALENVS="1"
export PIPENV_VENV_IN_PROJECT="true"
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgreprc
export VISUAL="nvim"
export VIRTUAL_ENV_DISABLE_PROMPT="1"
export MANPAGER='nvim +Man!'
export TERM="alacritty"

# Man page colors
export LESS_TERMCAP_md=$(printf "\e[01;32m")    # bold
export LESS_TERMCAP_us=$(printf "\e[01;33m")    # underline
export LESS_TERMCAP_so=$(printf "\e[01;30;44m") # reversed
export LESS_TERMCAP_mb=$(printf "\e[01;36m")    # blink
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS="--RAW-CONTROL-CHARS"

# BASH specifics
export HISTCONTROL="ignoredups:erasedups"
export HISTSIZE="500000"
export HISTFILESIZE="100000"

# FISH specifics
export fish_color_autosuggestion="brblack"
export fish_color_command="brblue"
export fish_color_comment="brred"
export fish_color_cwd_root="red"
export fish_color_end="brmagenta"
export fish_color_error="brred"
export fish_color_escape="brcyan"
export fish_color_history_current="--bold"
export fish_color_host="normal"
export fish_color_match="--background=brblue"
export fish_color_normal="normal"
export fish_color_operator="cyan"
export fish_color_param="brblue"
export fish_color_quote="yellow"
export fish_color_redirection="bryellow"
export fish_color_search_match=("bryellow" "--background=brblack")
export fish_color_selection=("white" "--bold" "--background=brblack")
export fish_color_status="red"
export fish_color_user="brgreen"
export fish_color_valid_path="--underline"
export fish_pager_color_completion="normal"
export fish_pager_color_description="yellow"
export fish_pager_color_prefix=("white" "--bold" "--underline")
export fish_pager_color_progress=("brwhite" "--background=cyan")

# Extend PATH
[[ "$PATH" != *"$HOME/.local/bin"* ]] && export PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.cargo" ] && export CARGO_ROOT="$HOME/.cargo"
[ -d "$HOME/.cargo" ] && [[ "$PATH" != *"$HOME/.cargo"* ]] && export PATH="$PATH:$CARGO_ROOT/bin"
[ -d "$HOME/.pyenv" ] && 
export PYENV_ROOT="$HOME/.pyenv"
[ -d "$HOME/.pyenv" ] && [[ "$PATH" != *"$HOME/.pyenv"* ]] && export PATH="$PATH:$PYENV_ROOT/bin"
[ -d "/opt/clang-format-static" ] && export PATH="$PATH:/opt/clang-format-static"

export GOPRIVATE='github.com/vippsas/*'
export G0111MODULE=on
export RMVIEW_CONF=$HOME/.rmview.json
export PYFLYBY_PATH=$HOME/.config/pyflyby.py:.../.pyflyby.py
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

setxkbmap no
. "$HOME/.cargo/env"
