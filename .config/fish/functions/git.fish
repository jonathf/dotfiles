# Defined in - @ line 1
function git --description 'alias git git'
    set --local git_dir
    set --local work_tree
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set git_dir "--git-dir=$HOME/.config/dotfiles"
        set work_tree "--work-tree=$HOME"
        echo (set_color brblack)$git_dir\n$work_tree(set_color normal) >&2
    end
    command git $git_dir $work_tree $argv
end
