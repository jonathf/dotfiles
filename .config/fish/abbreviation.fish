abbr a git add
abbr aa git add -u
abbr am git commit --amend
abbr amf "git commit --amend -a --no-edit --allow-empty && git push -f --force-with-lease"
abbr cm git commit
abbr cma git commit -a
abbr co git checkout
abbr cob git checkout -b
abbr d git diff
abbr en xmodmap ~/.Xmodmap
abbr i ipython --nosep
abbr p python
abbr l git --no-pager graph -20
abbr la ls --all
abbr ll ls --long
abbr n nvim
abbr no xmodmap ~/.Xmodmap-no
abbr o open
abbr pl git pull --rebase
abbr ps git push
abbr psf git push --force-with-lease --force
abbr pst git push --force-with-lease --tags
abbr psu git push --set-upstream
abbr rb git rebase
abbr rba git rebase --abort
abbr rbc git rebase --continue
abbr rbs git rebase --skip
abbr rbi git rebase --interactive
abbr s git status --short --branch
abbr t pytest -vv --doctest-modules
abbr vi nvim
abbr vim nvim
abbr y yadm
abbr z zathura
abbr mypy-pip /home/jonathf/.local/share/nvim/mason/packages/mypy/venv/bin/pip

abbr tf --function tf_expand
function tf_expand
  set --local _arg (git rev-parse --show-toplevel 2>/dev/null)
  if test -n "$_arg"
    set _arg " -chdir=$_arg/$TERRAFORM_ROOT"
  end
  echo "terraform$_arg"
end

function tds_expand
  echo (string replace -ra '^tds-?' 'TDS-' $argv)
end
abbr tds_expansion --regex 'tds(\d+-?\w*)' --position anywhere --function tds_expand

function bang_bang; echo $history[1]; end
abbr !! --regex '!!' --position anywhere --function bang_bang
function bang_2; echo $history[2]; end
abbr !2 --regex '!2' --position anywhere --function bang_2
function bang_3; echo $history[3]; end
abbr !3 --regex '!3' --position anywhere --function bang_3
function bang_4; echo $history[4]; end
abbr !4 --regex '!4' --position anywhere --function bang_4


abbr 27 install_python_environment 2 7
abbr 37 install_python_environment 3 7
abbr 38 install_python_environment 3 8
abbr 39 install_python_environment 3 9
abbr 310 install_python_environment 3 10
abbr 311 install_python_environment 3 11
