function __transient_prompt_func
    set --local color green
    if test $transient_pipestatus[-1] -ne 0
        set color red
    end
    echo -en (set_color $color)"❯ "(set_color normal)
end

# Check if these functions have been transient
#     __fish_mode_prompt:   First Render
#     __fish_prompt:        Second Render
#     __fish_right_prompt:  Third Render
function __transient_event_emit
    __fish_mode_prompt
    __fish_prompt
    __fish_right_prompt
end

function __transient_check_by_event --on-event fish_prompt --on-variable VIRTUAL_ENV
    __transient_event_emit
end

__transient # install

function __transient_uninstall --on-event transient_uninstall
    if type --query __transient_old_fish_mode_prompt
        functions --erase fish_mode_prompt
        functions --copy __transient_old_fish_mode_prompt fish_mode_prompt
    end

    if type --query __transient_old_fish_prompt
        functions --erase fish_prompt
        functions --copy __transient_old_fish_prompt fish_prompt

        # replace $transient_[pipe]status to $[pipe]status
        functions -v fish_prompt | string replace '$transient_pipestatus' '$pipestatus' | string replace '$transient_status' '$status' | source
    end

    if type --query __transient_old_fish_right_prompt
        functions --erase fish_right_prompt
        functions --copy __transient_old_fish_right_prompt fish_right_prompt
    end

    functions --erase (functions --all | string match --entire -r '^_?_?transient')

    bind --user | string replace --filter --regex -- "bind (.+)( '?__transient.*)" 'bind -e $1' | source
    set --names | string replace --ignore-case --filter --regex -- '(^transient.*)' 'set -e $1' | source
    set --names | string replace --ignore-case --filter --regex -- '(^__fish_.*_md5$)' 'set -e $1' | source
end
