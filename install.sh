#!/bin/sh
tmuxconf_symlink_target=~/.tmux.conf
if [ -L $tmuxconf_symlink_target ]; then
    echo "$tmuxconf_symlink_target symlink already exists, skipping..."
else
    ln -s `pwd`/tmux/.tmux.conf $tmuxconf_symlink_target
    echo "Created symlink to $tmuxconf_symlink_target"
fi
vimrc_symlink_target=~/.vimrc
if [ -L $vimrc_symlink_target ]; then
    echo "$vimrc_symlink_target symlink already exists, skipping..."
else
    ln -s `pwd`/vim/_vimrc $vimrc_symlink_target
    echo "Created symlink to $vimrc_symlink_target"
    vim +PluginInstall +qall
    echo "Installed Vundle plugins silently."
fi
vimdir_symlink_target=~/.vim
if [ -L $vimdir_symlink_target ]; then
    echo "$vimdir_symlink_target exists, skipping..."
else
    ln -s `pwd`/vim $vimdir_symlink_target
    echo "Created symlink to $vimdir_symlink_target"
fi
echo "Install script finished."
