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
	ln -s $REPODIR/$pathfragment $TARGETHOMEDIR/$pathfragment
	return 0
}

