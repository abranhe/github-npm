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
# if ! $(checkStatus); then
# 	echo -e "${RED}Please commit your changes before creating a release${RESET}"
# 	exit 0
# fi


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

# Non argument statement
if [ $# -eq 0 ]; then
    echo -e "$(logo)"
    exit 1
fi

# Check for invalid arguments
if [[ ! " ${COMMANDS[@]} " =~ " ${first} " ]]; then
    echo -e "${RED}github-npm: '${first}' is not a valid command. ${RESET}" # "$(test ! -z " $all" -a "$all" != " " && echo "\nParameters: $all" || echo "") ${RESET}"
		echo "See 'github-npm -h' for more information"
		exit 0
fi

# When user ask for help
if [[ " ${COMMANDS[0]} " =~ " ${first} " ]] || [[ " ${COMMANDS[1]} " =~ " ${first} " ]]; then
	echo -e "$(help)"
fi

# Publish verion to npm (major, minor, patch)
if [[ " ${COMMANDS[2]} " =~ " ${first} " ]] || [[ " ${COMMANDS[3]} " =~ " ${first} " ]] || [[ " ${COMMANDS[4]} " =~ " ${first} " ]]; then

	# TODO
	case ${first} in
		${COMMANDS[2]})
			$(publishToNPM)
		${COMMANDS[3]})
			$(publishToNPM)
		${COMMANDS[4]})
			$(publishToNPM)
esac
fi

# When user ask for help
if [[ " ${COMMANDS[7]} " =~ " ${first} " ]]; then
	echo "$PACKAGE_VERSION"
fi




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
