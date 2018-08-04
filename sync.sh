#!/bin/zsh
# sync.sh - utility for transferring config changes to/from local installation and git repo.

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

function put_ssh_config {
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
}

function copy_host_to_repo {
    cp ~/.Xresources .
    cp ~/.xinitrc .
    cp -R ~/.config .
}

function copy_repo_to_host {
    cp .Xresources ~/
    cp .xinitrc ~/
    cp -R .config ~/
    put_ssh_config
    # create_symlink ~/.tmux.conf `pwd`/tmux/tmux.conf
}


##### start of script #####

flag=()
zparseopts -D -- -host-to-git::=flag -git-to-host::=flag
if [[ $#flag -ne 1 ]]; then
    echo "Pass exactly one argument to this script: --host-to-git --git-to-host"
    exit 1
fi

if [[ $flag == --host-to-git ]]; then
    copy_host_to_repo
else
    copy_repo_to_host
fi

echo "Install script finished."
