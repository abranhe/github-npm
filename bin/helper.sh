#!/usr/bin/env bash
#
# MIT (c) 2018 Carlos Abraham Hernandez
#
# helper.sh
#
# Easy way to release npm packages on Github
# Issues: https://github.com/19cah/github-npm/issues

# Args
first=$1
second=$2
third=$3
all=${@:2}

# Colors
RESET="\033[0m"
REVERSE="\033[07m"
PINK="\033[95m"
GREEN="\033[1;32m"
BLUE="\033[01;34m"
WHITE="\033[1;37m"
RED='\033[0;31m'
DARKRED="\033[1;31m"

# Help Fuction
function help()
{
	echo -e "
${PINK}Usage${RESET}:
	${PINK}${REVERSE}$ npx github-npm <command...>${RESET}

${PINK}Where${RESET} command is:
	${WHITE}-h  help          show help${RESET}
	${GREEN}<version>${RESET}         avilable [<major>,<minor>, <patch>]
	-m  <message>     custom message
	--tag  <tag>      custom tag value
	--version         package version
"
}

# Getting package version
PACKAGE_VERSION=$(cat package.json\
		| grep version\
		| head -1 \
		| awk -F: '{ print $2 }' \
	  | sed 's/[",]//g')


function checkStatus() {
	if [ -n "$(git status --porcelain)" ]; then
	  # echo "there are changes";
		return 1;
	else
	  # echo "no changes";
		return 0;
	fi
}
