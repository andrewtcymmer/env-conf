#!/bin/zsh
# sync.zsh - utility for transferring config changes to/from local installation and git repo.

source funcs.zsh

##### start of script #####

# Keeping this block around in case it is needed later.
#flag=()
#zparseopts -D -- -host-to-git::=flag -git-to-host::=flag
#if [[ $#flag -ne 1 ]]; then
#    echo "Pass exactly one argument to this script: --host-to-git --git-to-host"
#    exit 1
#fi

TARGETHOMEDIR=~
REPOCFGDIR=`pwd`/content

for file in `find $REPOCFGDIR -type f -name "*"`; do
	symlink_to_repo ${file:$(($#REPOCFGDIR+1))}
done

add_github_to_ssh_config

echo "All files up-to-date."
