<img src="https://cdn.abranhe.com/projects/github-npm/logo.svg" width="200px">
<br>
<br>

# github-npm

> Publish and release NPM packages on Github

[![Github](https://github.com/abranhe/github-npm/workflows/build/badge.svg)](https://github.com/abranhe/github-npm)
[![npm](https://img.shields.io/npm/v/github-npm.svg)](https://www.npmjs.com/package/github-npm)

## Usage

```
github-npm patch -m "The coolest release"
```

## API

```
Usage:

	npx github-npm <command...>

Where command can be one of:

	patch - version when you make backwards compatible bug fixes
	minor - version when you add functionality in a backwards compatible manner,
	major - version when you make incompatible API changes

Options:
	 -h  --help           Show this help and exit"
	 -m  --message        Release message"
	 -v  --version        View package version"
	 -p  --path           Path to package.json"
	 -b  --branch         Branch to release"
```

Read more about [Semantic Versioning](https://semver.org/).

## Related

[**gong** ](https://github.com/abranhe/gong): Gem on Github

## License

MIT © [Abraham Hernandez](https://abranhe.com)
