# Example of a good README

Short and brief sales speech

## 😠 Motivations

Why was this software made and what types of user does it target?

## ✨ Features

Brief descriptions of core features

* ✅ Foo

> While this is not strictly a feature, this software is [free](https://www.gnu.org/philosophy/free-sw.en.html), [self-hosted](https://en.wikipedia.org/wiki/Self-hosting_(web_services)) and [unhosted](https://unhosted.org).  

> 💡 Missing a feature? Checkout the [TODO file](./TODO.md) to see what work is in progress.

## 🎮 Demo

> It is recommended that [you setup your own instance](#️-usage) if you intend to continue using the software.

You can test the software [here](https://github.com/thoughtsunificator/dotfiles).

## Usage

**Prerequisites**:

* Node.js >=18.0.0
* npm >=8.0.0

### 📦 Static build

Install dependencies:

- ``npm install``

Build the application:
- ``npm run build``
> The build files are available under **dist/app-prod**.

You can then use any web server of your liking to serve the build files.

<details>
  <summary>Here is an example of configuration for nginx</summary>
  
  ```nginx
  server {
    root /var/www/html; # This should match the directory where the bundle files are located.

    location / {
        try_files $uri /index.html;
    }

    # this could be its own site instead
    location /api {
        proxy_pass http://127.0.0.1:3001;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "Upgrade";
        proxy_set_header Host $host;
    }
}
  ```
  
</details>

### 🐳 Docker

Run ```docker-compose up -d```

> 💡 The application is available on http://localhost:3000 by default.

## ⚙️ Configuration

Configuration is explained over [here](data/README.md).

## 🚀 How to use

Please refer to the [user manual](./documentation/user-manual.md).

## 🔨 Development

> It is recommended to read the [developer manual](../documentation/developer-manual.md).

Install dependencies:
- ``npm install``

To both serve and build with autoreloading:
- ``npm start``

> 💡 This command starts an HTTP server (listening on http://localhost:3000 by default) with livereload enabled.

> 💡 You can also start the application on any other port/host: ``HOST=localhost PORT=3001 npm start``

### 🧪 Testing

Lint:
- ``npm run test:lint``

Lint individually:

- <details>
  <summary>Spoiler</summary>

  Javascript files ([eslint](https://github.com/eslint/eslint)):
  - ``npm run test:lint:ecmascript``

  CSS files ([stylelint](https://github.com/stylelint/stylelint)):
  - ``npm run test:lint:css``
  
</details>

Run test with [ava](https://github.com/avajs/ava):
- ``npm test``
> Use the ``NODE_DEBUG=foo`` env to enable debug logs while testing.
> ``npm run test:watch`` is also available if you want to enable ava's [watch mode](https://github.com/avajs/ava/blob/main/docs/recipes/watch-mode.md). 

Coverage:
- ``npm run build:coverage``
> The coverage report files are available under **dist/coverage**

## 🧒 Contributions

Contributions [are more than welcome](./.github/CONTRIBUTING.md).

## 👾 Bug report 

❗Please search [the existing issues](https://github.com/thoughtsunificator/dotfiles/labels/bug) and make sure the bug has not already been reported before making a new one.

To report a bug please use [this link](https://github.com/thoughtsunificator/dotfiles/issues/new?template=bug_report.md).

## 💡 Feature request 

❗Make sure your suggestion is not already on the [TODO.md](TODO.md) and hasn't [already been requested](https://github.com/thoughtsunificator/dotfiles/labels/enhancement).

To suggest an idea please use [this link](https://github.com/thoughtsunificator/dotfiles/issues/new?template=feature_request.md).


