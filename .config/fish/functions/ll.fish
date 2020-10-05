# Defined in - @ line 1
function ll --description 'alias ll exa -l -g --git' --wraps 'exa -l'
    set --local git_dir
    set --local work_tree
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set git_dir "$HOME/.config/dotfiles"
        set work_tree "$HOME"
    end
    env GIT_DIR=$git_dir GIT_WORK_TREE=$work_dir exa --long --git $argv;
end
