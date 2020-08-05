function fish_prompt
	source $FISH_ROOT/prompt/prompt_first_line.fish
	source $FISH_ROOT/prompt/prompt.fish

    set --local exit_code $status  # save previous exit code

    echo -e -n "\r\033[K"  # init prompt context (clear current line, etc.)
    echo -e (prompt_first_line)  # print current path, git branch/status, command duration
    echo -e -n (prompt $exit_code)  # print prompt
    echo -e (set_color normal)" "  # reset colors and end prompt
end
