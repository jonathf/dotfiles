export QT_QPA_PLATFORMTHEME="qt5ct"
export QUTE_QT_WRAPPER="PyQt6"
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
export VISUAL="nvim --cmd 'let g:flatten_wait=1'"
export VIRTUAL_ENV_DISABLE_PROMPT="1"
export MANPAGER='nvim +Man!'
export TERM="xterm-256color"
export CLICOLOR=1

export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'"

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
[[ "$PATH" != *"/usr/local/bin"* ]] && export PATH="/usr/local/bin:$PATH"
export PATH=$(echo $PATH | sed -e  's,/opt/homebrew/bin:,,' | sed -e 's,/opt/homebrew/sbin:,,')

export COREUTILS_ROOT=/usr/local/opt/coreutils/libexec/gnubin
[[ -d "$COREUTILS_ROOT" ]] && export PATH=$COREUTILS_ROOT:$PATH

export GNUSED_ROOT="/usr/local/opt/gnu-sed/libexec/gnubin"
[[ -d "$GNUSED_ROOT" ]] && export PATH=$GNUSED_ROOT:$PATH

export CARGO_ROOT="$HOME/.cargo"
[[ "$PATH" != *"$CARGO_ROOT/bin"* ]] && export PATH="$PATH:$CARGO_ROOT/bin"
[[ -f "$CARGO_ROOT/env" ]] && . "$CARGO_ROOT/env"

[ -d "$HOME/.pyenv" ] && export PYENV_ROOT="$HOME/.pyenv"
[ -d "$HOME/.pyenv" ] && [[ "$PATH" != *"$HOME/.pyenv"* ]] && export PATH="$PATH:$PYENV_ROOT/bin"
[ -d "$HOME/.pyenv" ] && eval "$(pyenv init -)"

[ -d "/opt/clang-format-static" ] && export PATH="$PATH:/opt/clang-format-static"

export RMVIEW_CONF=$HOME/.rmview.json
export PYFLYBY_PATH=$HOME/.config/pyflyby.py:.../.pyflyby.py
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
export AWS_REGION="eu-west-1"
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/glittertind-4bcaf3ba3c05.json"

export KD=confluent-gp.dev.transhub.io:9092
export KT=confluent-gp.tet.transhub.io:9092
export KS=confluent-gp.stage.transhub.io:9092
export KP=confluent-gp.transhub.io:9092
