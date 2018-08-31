#!/bin/zsh
# funcs.zsh - utility for transferring config changes to/from local installation and git repo.
# These are used by sync.zsh.

function sep_path {
	local whole_enchilada=$1
	echo $(basename $whole_enchilada)
	echo ${whole_enchilada[1,$((-${#filename}-1))]}
}

function symlink_to_repo {
	local pathfragment=$1; shift
	if [ -L $TARGETHOMEDIR/$pathfragment ]; then return 0; fi   # ignore existing symlinks
	if [ -d $TARGETHOMEDIR/$pathfragment ]; then return 1; fi   # error if this is a directory
	# make a backup if the file exists
	if [ -f $TARGETHOMEDIR/$pathfragment ]; then mv $TARGETHOMEDIR/$pathfragment $TARGETHOMEDIR/$pathfragment.bak; fi
	# make the symlink
	echo "Creating symlink to $pathfragment ..."
	ln -s $REPOCFGDIR/$pathfragment $TARGETHOMEDIR/$pathfragment
	return 0
}

function add_github_to_ssh_config {
	local sshdir=$TARGETHOMEDIR/.ssh
	if [ ! -d $sshdir ]; then mkdir $sshdir; fi
	local sshcfg=$sshdir/config
	if [ ! -e $sshcfg ]
	then 
		touch $sshcfg
		chmod 600 $sshcfg
	fi
	if ! grep -q "host github.com" $sshcfg 
	then
		echo "" >> $sshcfg
		echo "### Public GitHub" >> $sshcfg
		echo "host github.com" >> $sshcfg
		echo "\tHostname github.com" >> $sshcfg
		echo "\tUser git" >> $sshcfg
		echo "\tIdentityFile ~/update/this/yourself" >> $sshcfg
	fi
}

function add_vimplug {
	local vimplug_file=~/.config/nvim/autoload/plug.vim
	if [ ! -f $vimplug_file ]
	then
		echo Adding vim-plug file from source repository...
		curl -fLo $vimplug_file --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
}
