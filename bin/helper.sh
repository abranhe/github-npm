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
YELLOW="\033[0;33m"
BYELLOW="\033[1;33m"
IYELLOW="\033[0;93m"
BIYELLOW="\033[1;93m"
IRED="\033[0;91m"
BRed='\033[1;31m'


red="\033[38;5;160m"
red1="\033[38;5;161m"
red2="\033[38;5;162m"
red3="\033[38;5;163m"
red4="\033[38;5;164m"
red5="\033[38;5;165m"

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

# Check git status
function checkStatus() {
	if [ -n "$(git status --porcelain)" ]; then
	  # if there are changes
		return 1;
	else
	  # if there not changes
		return 0;
	fi
}

# GITHUB-NPM
function logo() {

echo "${red5}          \$\$\   \$\$\     \$\$\                 \$\$\                                                                                                 ${RESET}"
echo "${red4}          \__|  \$\$ |    \$\$ |                \$\$ |                                                                                                  ${RESET}"
echo "${red4} \$\$\$\$\$\$\  \$\$\ \$\$\$\$\$\$\   \$\$\$\$\$\$\$\  \$\$\   \$\$\ \$\$\$\$\$\$\$\          \$\$\$\$\$\$\$\   \$\$\$\$\$\$\  \$\$\$\$\$\$\\\$\$\$\$\  ${RESET}"
echo "${red3}\$\$  __\$\$\ \$\$ |\_\$\$  _|  \$\$  __\$\$\ \$\$ |  \$\$ |\$\$  __\$\$\ \$\$\$\$\$\$\ \$\$  __\$\$\ \$\$  __\$\$\ \$\$  _\$\$  _\$\$\                 ${RESET}"
echo "${red3}\$\$ /  \$\$ |\$\$ |  \$\$ |    \$\$ |  \$\$ |\$\$ |  \$\$ |\$\$ |  \$\$ |\______|\$\$ |  \$\$ |\$\$ /  \$\$ |\$\$ / \$\$ / \$\$ |                      ${RESET}"
echo "${red2}\$\$ |  \$\$ |\$\$ |  \$\$ |\$\$\ \$\$ |  \$\$ |\$\$ |  \$\$ |\$\$ |  \$\$ |        \$\$ |  \$\$ |\$\$ |  \$\$ |\$\$ | \$\$ | \$\$ |                    ${RESET}"
echo "${red2}\\$\$\$\$\$\$\$ |\$\$ |  \\\$\$\$\$  |\$\$ |  \$\$ |\\\$\$\$\$\$\$  |\$\$\$\$\$\$\$  |        \$\$ |  \$\$ |\$\$\$\$\$\$\$  |\$\$ | \$\$ | \$\$ |       ${RESET}"
echo "${red1} \____\$\$ |\__|   \____/ \__|  \__| \______/ \_______/         \__|  \__|\$\$  ____/ \__| \__| \__|                                                    ${RESET}"
echo "${red1}\$\$\   \$\$ |                                                              \$\$ |                                                                      ${RESET}"
echo "${red}\\\$\$\$\$\$\$  |                                                              \$\$ |                                                                   ${RESET}"
echo "${red} \______/                                                               \__|                                                                            ${RESET}"
echo "
${PINK}Usage${RESET}:
	${PINK}${REVERSE}$ npx github-npm <command...>${RESET}\n
${PINK}or${RESET}:
	${PINK}${REVERSE}$ github-npm <command...>${RESET}\n
${WHITE}See 'github-npm help' for more information${RESET}"
}
