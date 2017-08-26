#!/bin/bash
function create_symlink {
    local symlink_target=$1
    local file_target=$2
    if [ -L $symlink_target ]; then
        echo "$symlink_target symlink already exists, skipping..."
    else
        ln -s $file_target $symlink_target
        echo "Created symlink to $symlink_target"
    fi
}

create_symlink ~/.tmux.conf `pwd`/tmux/tmux.conf
create_symlink ~/.vim `pwd`/vim
create_symlink ~/.vimrc `pwd`/vim/_vimrc
# vim +PluginInstall +qall

echo "Install script finished."
