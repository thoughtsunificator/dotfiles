# Developer manual

This manual is aimed at developers and attempts to describe the technical parts of the software.

## Technologies

The client uses the front-end library [domodel](https://github.com/thoughtsunificator/domodel) which leverages [rollup](https://github.com/rollup/rollup) to generate a bundle of all the javascript files under `src/` (ecmascript modules) using [src/main.js](../src/main.js) as the entrypoint.

### Application

- [domodel](https://github.com/thoughtsunificator/domodel)

### Bundler

- [rollup](https://github.com/rollup/rollup) (bundle `src/main.js` to dist/app-dev or dist/app-prodt)

### Static analysis

- [eslint](https://github.com/eslint/eslint) (analysis for `.js` files)
- [stylelint](https://github.com/stylelint/stylelint) (analysis for `.css` files)

### Testing

- [avajs](https://github.com/avajs/ava) (unit testing)
- [jsdom](https://github.com/jsdom/jsdom)

## Object hierarchy

Explain...

## Life cycle

[Explain how the application starts]

## Guidelines

This guide lists, non-exhaustively, a few guidelines to follow when contributing to the code base.

As the guidelines are enforced by tools such as [eslint](https://github.com/eslint/eslint) and [stylelint](https://github.com/stylelint/stylelint), for the most part you can easily verify that your work is compliant (in terms of style) using `npm run lint`.

And to make things even easier, as you commit, your work is automatically verified using git hooks installed by [husky](https://github.com/typicode/husky).

### Code style

- code shall be written in English
- UTF-8 for the file encoding
- LF for the end of line sequence
- indentation is 2 tabs (except when its not and `.editorconfig` will make sure to police your IDE about that)
- maximum text width is 200 characters
- no space to indent, no trailing spaces
- no trailing semi-colon unless necessary
- code shall be documented using english and [jsdoc](https://github.com/jsdoc/jsdoc) (version 4)
- code shall be tested using [avajs](https://github.com/avajs/ava)
- no copyring shall be present in the source files a the sole exception of the LICENSE file
- tool configuration file begins with `.` and are placed at the root of the project
- modules import order is as follow: third-party modules, observables, models
- ecmascript classes or function declaration (no expression function style)

## Folder structure

In addition to the dot files which contain the tooling configurations the application is several folders:

```
├── data - data, sample and configuration files
├── dist - build artifacts
├── docker - container images configuration files
├── documentation - user and developer guides
├── public - static files
├── src - source files
├── test - test setups
```

### `src/`

```
├── model - models, bindings event listeners and their tests
└── object - observable classes and their tests
└── persistence - anything related to data persistence
```

## Workflow

Explain dev. workflow here

## Testing

Explain what is expected from test and how do go about testing.

Testing is all about testing behaviors.

Usually, test file ends with .test.js and are placed beside the source file they test against.

## Roadmap

A simplified version of the roadmap is available in the [TODO.md](../TODO.md) file. Otherwise, checkout the [enhancement issues](https://github.com/thoughtsunificator/dotfiles/labels/enhancement).
