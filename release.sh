#!/usr/bin/env bash
#
# MIT (c) 2018 Carlos Abraham Hernandez
#
# release.sh
#
# Easy way to release npm packages on Github
# Issues: https://github.com/19cah/github-npm/issues

#----------------------------- Helper ------------------------------------------
# Args
arg1=$1
arg2=$2
arg3=$3
all=${@}

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


LOGO="\033[38;5;160m"
LOGO1="\033[38;5;161m"
LOGO2="\033[38;5;162m"
LOGO3="\033[38;5;163m"
LOGO4="\033[38;5;164m"
LOGO5="\033[38;5;165m"

# Help Fuction
function help()
{
	echo -e "
${PINK}Usage${RESET}:
	${PINK}${REVERSE}$ npx github-npm <command...>${RESET}
${PINK}Where${RESET} command is:
	${GREEN}-h  help${RESET}                     show help
	${GREEN}--version${RESET}                    view package version
	${GREEN}<version>${RESET}                    select between <patch, minor, major>
	${GREEN}<version> -m <message>${RESET}       add a custom message to commit
	                             Eg: $ github-npm patch -m \"drop new realese\"
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
function logo()
{
	echo "${LOGO5}          \$\$\   \$\$\     \$\$\                 \$\$\                                                                                                 ${RESET}"
	echo "${LOGO4}          \__|  \$\$ |    \$\$ |                \$\$ |                                                                                                  ${RESET}"
	echo "${LOGO4} \$\$\$\$\$\$\  \$\$\ \$\$\$\$\$\$\   \$\$\$\$\$\$\$\  \$\$\   \$\$\ \$\$\$\$\$\$\$\          \$\$\$\$\$\$\$\   \$\$\$\$\$\$\  \$\$\$\$\$\$\\\$\$\$\$\  ${RESET}"
	echo "${LOGO3}\$\$  __\$\$\ \$\$ |\_\$\$  _|  \$\$  __\$\$\ \$\$ |  \$\$ |\$\$  __\$\$\ \$\$\$\$\$\$\ \$\$  __\$\$\ \$\$  __\$\$\ \$\$  _\$\$  _\$\$\                 ${RESET}"
	echo "${LOGO3}\$\$ /  \$\$ |\$\$ |  \$\$ |    \$\$ |  \$\$ |\$\$ |  \$\$ |\$\$ |  \$\$ |\______|\$\$ |  \$\$ |\$\$ /  \$\$ |\$\$ / \$\$ / \$\$ |                      ${RESET}"
	echo "${LOGO2}\$\$ |  \$\$ |\$\$ |  \$\$ |\$\$\ \$\$ |  \$\$ |\$\$ |  \$\$ |\$\$ |  \$\$ |        \$\$ |  \$\$ |\$\$ |  \$\$ |\$\$ | \$\$ | \$\$ |                    ${RESET}"
	echo "${LOGO2}\\$\$\$\$\$\$\$ |\$\$ |  \\\$\$\$\$  |\$\$ |  \$\$ |\\\$\$\$\$\$\$  |\$\$\$\$\$\$\$  |        \$\$ |  \$\$ |\$\$\$\$\$\$\$  |\$\$ | \$\$ | \$\$ |       ${RESET}"
	echo "${LOGO1} \____\$\$ |\__|   \____/ \__|  \__| \______/ \_______/         \__|  \__|\$\$  ____/ \__| \__| \__|                                                    ${RESET}"
	echo "${LOGO1}\$\$\   \$\$ |                                                              \$\$ |                                                                      ${RESET}"
	echo "${LOGO}\\\$\$\$\$\$\$  |                                                              \$\$ |                                                                    ${RESET}"
	echo "${LOGO} \______/                                                               \__|                                                                             ${RESET}"
	echo "
${PINK}Usage${RESET}:
	${PINK}${REVERSE}$ npx github-npm <command...>${RESET}\n
${PINK}or${RESET}:
	${PINK}${REVERSE}$ github-npm <command...>${RESET}\n
${WHITE}See 'github-npm --help' for more information${RESET}"
}

function publishToNPM()
{
	git checkout master &>1.log

	npm install &>2.log

	npm version ${arg1}
	git add package.json package-lock.json # package.json and package-lock.json  should change

	if [ -z "${arg2}" ]; then
		# Default commit
		git commit -m "${PACKAGE_VERSION} published"
	elif [[ "${arg2}" =~ "-m" ]]; then
		if [ -z "${arg3}" ]; then
			echo -e "${RED}Must have a commit message${RESET}"
		else
			git commit -m "${arg3}"
		fi
	fi

	# Publish package
	npm publish &>3.log
	echo -e "$(message "Publishing package")"

	# Tag version
	git tag -a "v${PACKAGE_VERSION}" -m  "Welcome to ${PACKAGE_VERSION} version"
	git push origin --tags &>4.log
	echo -e "$(message "Creating tags")"

	# Save to 1 file
	cat 1.log 2.log 3.log 4.log 5.log >> github-npm.log

	rm -rf 1.log 2.log 3.log 4.log 5.log

	# Push commits
	git push origin master &>5.log
}


function message ()
{
	echo "\033[1K"
	echo -e "
${GREEN}✔︎ "$@" ${RESET}
"
}

#-------------------------- End of Helper --------------------------------------


# Check if there are changes to be committed
if ! $(checkStatus); then
	echo -e "${RED}✖︎ Please commit your changes before creating a release${RESET}"
	exit 0
fi


# Commands
COMMANDS=(
	"--help"
	"-h"
	"major"
	"minor"
	"patch"
	"--tag"
	"-m"
	"--version"
)

# Non argument statement
if [ $# -eq 0 ]; then
    echo -e "$(logo)"
    exit 0
fi

# Check for invalid arguments
if [[ ! " ${COMMANDS[@]} " =~ " ${arg1} " ]]; then
    echo -e "${RED}github-npm: '${arg1}' is not a valid command. ${RESET}"
		echo "See 'github-npm -h' for more information"
		exit 0
fi

# When user ask for help
if [[ " ${COMMANDS[0]} " =~ " ${arg1} " ]] || [[ " ${COMMANDS[1]} " =~ " ${arg1} " ]]; then
	echo -e "$(help)"
fi

# Publish verion to npm (major, minor, patch)
if [[ " ${COMMANDS[2]} " =~ " ${arg1} " ]] || [[ " ${COMMANDS[3]} " =~ " ${arg1} " ]] || [[ " ${COMMANDS[4]} " =~ " ${arg1} " ]]; then

	case ${arg1} in
		${COMMANDS[2]})
			echo "$(publishToNPM)"
			;;
		${COMMANDS[3]})
			echo "$(publishToNPM)"
			;;
		${COMMANDS[4]})
			echo "$(publishToNPM)"
			;;
esac
fi

# When user ask for help
if [[ " ${COMMANDS[7]} " =~ " ${arg1} " ]]; then
	echo "$PACKAGE_VERSION"
fi
