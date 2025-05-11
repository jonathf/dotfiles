function install_python_environment --description 'create python virtual environment and install some base dependencies'
  set -l source_folder ~/.venv/(basename $PWD)/$argv[1]$argv[2]
  if test ! -f $source_folder
    uv venv --python python$argv[1].$argv[2] $source_folder
  end
  source $source_folder/bin/activate.fish
  env UV_PROJECT_ENVIRONMENT=$source_folder uv pip install -Ur ~/.config/requirements.txt
  if test ! -f ./.envrc
    echo "export UV_PROJECT_ENVIRONMENT=$source_folder" > .envrc
    echo "source \${UV_PROJECT_ENVIRONMENT}/bin/activate" >> .envrc
  else
    echo
    echo "You might want to add the following to your .envrc file:"
    echo
    echo "export UV_PROJECT_ENVIRONMENT=$source_folder"
    echo "source \${UV_PROJECT_ENVIRONMENT}/bin/activate"
    echo
  end
end
