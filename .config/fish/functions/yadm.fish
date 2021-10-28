# Defined via `source`
function yadm \
  --wraps='git --git-dir=/home/jonathf/.local/share/yadm/repo.git --git-work-tree=/home/jonathf' \
  --description 'alias yadm=env GIT_WORK_TREE=/home/jonathf yadm'
  # Make YADM work from any folder
  env GIT_WORK_TREE=$HOME yadm $argv; 
end
