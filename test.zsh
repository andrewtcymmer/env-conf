#!/bin/zsh
########################################################################################################
# test.zsh - Unit tests against the shell scripts included in env-conf repository.
# Credit for the idea for this testing method from Stack Overflow: https://stackoverflow.com/a/15612499

# Step 1.
# Define the test suite functions.

function clear_test_workspace() {
	if [ -z $TARGETHOMEDIR ]
	then
		echo "FATAL: \$TARGETHOMEDIR not defined when calling clear_test_workspace(). Exiting with error code 127."
		exit 127
	fi

	# setup - careful not to blow away the entire home directory
	if [[ -d $TARGETHOMEDIR && $TARGETHOMEDIR != $home ]]; then rm -rf $TARGETHOMEDIR; fi
}

function create_test_workspace() {
	if [ -z $TARGETHOMEDIR ]
	then
		echo "FATAL: \$TARGETHOMEDIR not defined when calling create_test_workspace(). Exiting with error code 127."
		exit 127
	fi
	if [[ ! -d $TARGETHOMEDIR && $TARGETHOMEDIR != $home ]]
	then
		mkdir $TARGETHOMEDIR
	else
		echo "Will not attempt to create the \$TARGETHOMEDIR because it either exists or is the real user home."
	fi
}

function assertEquals() {
	local msg=$1; shift
	local expected=$1; shift
	local actual=$1; shift
	if [ "$expected" != "$actual" ]; then
		echo "[Failed] $msg. Expected: $expected   Actual: $actual"
	else
		echo "[Passed] $msg"
	fi
}

function assertSymlink() {
	local msg=$1; shift
	local expected=$1; shift
	if [ -L $expected ]
	then 
		echo "[Passed] $msg"
	else
		echo "[Failed] $msg"
	fi
}

function assertFile() {
	local msg=$1; shift
	local expected=$1; shift
	if [ -f $expected ]
	then
		echo "[Passed] $msg"
	else
		echo "[Failed] $msg"
	fi
}

# Step 2. 
# Include the functions under test by source-ing them in.

source funcs.zsh


# Step 3.
# Mock any global variables needed for the tests or functions to run.

TARGETHOMEDIR=`pwd`/mock-home
REPOCFGDIR=`pwd`/content

# Step 4.
# Write your test scenarios.

# Test: does the symlink creation for a single file actually create the symlink? 
 
clear_test_workspace
create_test_workspace

symlink_to_repo .zshrc > /dev/null 2>&1
returncode=$?
assertSymlink "Making symlink to .zshrc results in a new symlink" $TARGETHOMEDIR/.zshrc
assertEquals "Making symlink to .zshrc has correct return code" 0 $returncode
symlink_to_repo .zshrc > /dev/null 2>&1
assertEquals "Re-making symlink to .zshrc has correct return code" 0 $?

# Test: does the symlink creation make a backup of an existing file before overwriting it with a symlink?

clear_test_workspace
create_test_workspace

touch $TARGETHOMEDIR/.zshrc
symlink_to_repo .zshrc > /dev/null 2>&1 
assertFile "Making symlink to .zshrc when a file already exists creates a backup" $TARGETHOMEDIR/.zshrc.bak

# TODO: define the next test

# Step 5.
# Clean up to leave the workspace the way it was cloned.

clear_test_workspace

