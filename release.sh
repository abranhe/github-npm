#!/usr/bin/env bash
#
# MIT (c) 2018 Abraham Hernandez <abraham@abranhe.com>
#
# release.sh
#
# Easy way to release npm packages on Github

RESET="\033[0m"
RED="\033[0;31m"
GREEN="\033[1;32m"

function version() {
	cat <package.json | grep version | head -1 | awk -F: '{ print $2 }' | sed 's/[",]//g'
}

function help() {
	echo
	echo "Usage:"
	echo
	echo "  github-npm <command>"
	echo
	echo "Where command can be one of:"
	echo
	echo "  patch - version when you make backwards compatible bug fixes"
	echo "  minor - version when you add functionality in a backwards compatible manner,"
	echo "  major - version when you make incompatible API changes"
	echo
	echo "Options:"
	echo "  -h  --help           Show this help and exit"
	echo "  -m  --message        Release message"
	echo "  -v  --version        View package version"
	echo "  -p  --path           Path to package.json"
	echo "  -b  --branch         Branch to release"
	echo
}

# Check if the git repository is clean
function checkStatus() {
	if [ -n "$(git status --porcelain)" ]; then
		return 1
	else
		return 0
	fi
}

function success() {
	echo -e "$GREEN✔︎$RESET $1"
}

function error() {
	echo -e "$RED✖︎$RESET $1"
}

# Publish to NPM
function publish() {
	git checkout master &>1.log

	npm install &>2.log

	npm version "$1"

	if [ -z "$2" ]; then
		# Default commit
		git commit -m "${PACKAGE_VERSION} published"
	elif [[ "$2" =~ "-m" ]]; then
		if [ -z "$3" ]; then
			echo -e "${RED}Must have a commit message${RESET}"
		else
			git commit -m "$3"
		fi
	fi

	# Publish package
	npm publish &>3.log
	echo -e "$(message "Package published")"

	# this is wrong
	versionTag=v$PACKAGE_VERSION

	# Tag version
	git tag -a "$versionTag" -m "Welcome to ${PACKAGE_VERSION} version" &>4.log
	git push origin --tags &>5.log
	echo -e "$(message "Tags Created")"

	rm -rf 1.log 2.log 3.log 4.log 5.log 6.log

	# Add and push commits
	git add . # package.json and package-lock.json  should change
	git push origin master

	echo -e "$(message "Committed all files to master")"
}

# Check if there are changes to be committed
# if ! $(checkStatus); then
# 	echo
# 	error "Please commit your changes before creating a release"
# 	echo
# 	exit 0
# fi

if [ $# -eq 0 ]; then
	COMMAND="help"
else
	COMMAND=$1
fi

case $COMMAND in
-h | --help)
	help
	;;
-m | --message)
	status
	;;
-v | --version)
	version
	;;
-p | --path)
	help
	;;
-b | --branch)
	help
	;;
*)
	error "Invalid command. Try --help"
	;;
esac
