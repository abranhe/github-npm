#!/usr/bin/env bash
#
# MIT (c) 2018 Carlos Abraham Hernandez
#
# release.sh
#
# Easy way to release npm packages on Github
# Issues: https://github.com/19cah/github-npm/issues

# Helper
source "bin/helper.sh"

# Check if there are changes to be committed
if ! $(checkStatus); then
	echo -e "${RED}Please commit your changes before creating a release${RESET}"
	exit 0
fi

# Commands
COMMANDS=(
	"help"
	"-h"
	"major"
	"minor"
	"patch"
	"--tag"
	"-m"
	"--version"
)

# Check for invalid arguments
if [[ ! " ${COMMANDS[@]} " =~ " ${first} " ]]; then
    echo -e "${RED}github-npm: '${first}' is not a valid command. ${RESET}" # "$(test ! -z " $all" -a "$all" != " " && echo "\nParameters: $all" || echo "") ${RESET}"
		echo "See 'github-npm -h' for more information"
		exit 0
fi

# When user ask for help
if [[ " ${COMMANDS[0]} " =~ " ${first} " ]] || [[ " ${COMMANDS[1]} " =~ " ${first} " ]] || [ $# -eq 0 ]; then
	echo -e "$(help)"
fi

# If user enter verson command
if [[ " ${COMMANDS[2]} " =~ " ${first} " ]] || [[ " ${COMMANDS[3]} " =~ " ${first} " ]] || [[ " ${COMMANDS[4]} " =~ " ${first} " ]]; then

	# TODO
	case ${first} in
		${COMMANDS[2]})
			echo "this is major" ;;
		${COMMANDS[3]})
			echo "this is minor " ;;
		${COMMANDS[4]})
			echo "this is patch " ;;
esac
fi

# When user ask for help
if [[ " ${COMMANDS[7]} " =~ " ${first} " ]]; then
	echo "$PACKAGE_VERSION"
fi



# if ([ "$1" != "major" ] && [ "$1" != "minor" ] && [ "$1" != "patch" ])
#   then
#     echo "please specify one of (major, minor, patch)"
#     exit
# fi


# git checkout master
# git add .
# git commit -m 'Save all to publish package'
#
# npm install
# npm version $1
#


#
# echo $PACKAGE_VERSION
#
# # Add all
# git add .
# git commit -m "$PACKAGE_VERSION published"
#
# # Publish package
# npm publish
#
# # Push commits
# git push origin master
#
# # Tag version
# git tag -a "v$PACKAGE_VERSION" -m  "Welcome to $PACKAGE_VERSION version"
# git push origin --tags


# Ask user
# read -p "read line  " read
# echo "${read}"
