<p align="center">
  	<img src="https://cdn.abraham.gq/projects/github-npm/logo.svg" width="300px">
</p>

<h1 align="center">github - npm</h1>

<p align="center">
  	<a href="https://npmjs.org/github-npm"><img src="https://nodei.co/npm/github-npm.png?compact=true" width="300px"></a>
</p>

> Release npm packages on Github never had been easier

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
Usage
	$ npx github-npm <version...>

Where version can be:
  patch | minor | major

Options
	-h, --help           Show help
	    --version        View package version
	-m, --message        Add a custom message to commit

Eg:
  $ github-npm patch -m "drop new realese"
```


# Api

- Go to master branch
- Publish npm package
- Commit changes with a default message of `package version published` or with custom message using `-m "your custom message"`
- Create a new semantic tag and publish it

Read more on my [blog](https://blog.19cah.com/2018/06/30/release-npm-packages-on-github).

# Author

|[![Carlos Abraham Logo](https://avatars3.githubusercontent.com/u/21347264?s=50&v=4)](https://19cah.com)|
| :-: |
| [Carlos Abraham](https://github.com/19cah) |

# Related

[**gong** ](https://github.com/19cah/gong): Gem on Github: Release gem packages easier on Github.

# License

[MIT](https://github.com/19cah/github-npm/blob/master/LICENSE) License © [Carlos Abraham](https://github.com/19cah)


[cash-me]: https://cdn.abraham.gq/badges/cash-me.svg
[patreon]: https://cdn.abraham.gq/badges/patreon.svg
