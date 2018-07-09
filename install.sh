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
create_symlink ~/.vim/colors/solarized.vim `pwd`/vim/vim-colors-solarized/colors/solarized.vim
create_symlink ~/.vimrc `pwd`/vim/_vimrc
# vim +PluginInstall +qall

if [ ! -d ~/.ssh ]
then
    mkdir ~/.ssh
fi
if [ -e ~/.ssh/config ]
then
    if grep "host github.com" ~/.ssh/config
    then
        echo "~/.ssh/config already contains an entry for GitHub. Skipping..."
    else
        echo "Adding a GitHub entry to ~/.ssh/config ..."
        cat ssh/config >> ~/.ssh/config
    fi
else
    echo "Did not find a ~/.ssh/config file, copying from this package..."
    cp ssh/config ~/.ssh/config
fi

echo "Install script finished."
