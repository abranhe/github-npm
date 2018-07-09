[![Carlos Abraham Logo](https://avatars3.githubusercontent.com/u/21347264?s=50&v=4)](https://19cah.com)

[![NPM](https://nodei.co/npm/github-npm.png?compact=true)](https://nodei.co/npm/github-npm/)

# Github - NPM

> Release npm packages on Github never had been easier

![Github-NPM](https://cdn.abraham.gq/projects/github-npm/github-npm.svg)

<!-- Badges -->
[![Patreon][patreon]](https://www.patreon.com/19cah)
[![Cash Me][cash-me]](https://cash.me/$19cah)
[![19cah](https://19cah.com/badge.svg)](https://github.com/19cah)
[![Build Status](https://img.shields.io/travis/19cah/github-npm.svg?logo=travis)](https://travis-ci.org/19cah/github-npm)
[![npm](https://img.shields.io/npm/v/github-npm.svg)](https://www.npmjs.com/package/github-npm)
[![license](https://img.shields.io/github/license/19cah/github-npm.svg)](https://github.com/19cah/github-npm/blob/master/LICENSE)
<!-- Badges -->


# Usage

```
Usage:
	$ npx github-npm <command...>

Where command is:
	-h  help                     show help
	--version                    view package version
	<version>                    select between <patch, minor, major>
	<version> -m message>        add a custom message to commit
	                             Eg: $ github-npm patch -m "drop new realese"
```

### Versions

| Version |                        | Eg:                  |
| ------- | ---------------------- | -------------------- |
| major   | `vX.Y.Z` ~> `vX+1.Y.Z` | `v0.0.0` ~> `v1.0.0` |
| minor   | `vX.Y.Z` ~> `vX.Y+1.Z` | `v0.0.0` ~> `v0.1.0` |
| patch   | `vX.Y.Z` ~> `vX.Y.Z+1` | `v0.0.0` ~> `v0.0.1` |

# Api

- Go to master branch
- Publish npm package
- Commit changes with a default message of `package version published` or with custom message using `-m "your custom message"`
- Create a new semantic tag and publish it

Read more on my [blog](https://blog.19cah.com/2018/06/30/release-npm-packages-on-github).

# License

[MIT](https://github.com/19cah/github-npm/blob/master/LICENSE) License © [Carlos Abraham](https://github.com/19cah)


[cash-me]: https://cdn.abraham.gq/badges/cash-me.svg
[patreon]: https://cdn.abraham.gq/badges/patreon.svg
