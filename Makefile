EMAIL=$(shell git config user.email)

all:
	@echo "Must specify a specific target, e.g. 'make build'"

build:
	npx @11ty/eleventy

# serve up the site at http://localhost:8080/
serve:
	npx @11ty/eleventy --serve

init:
	rm -rf node_modules
	rm -f package-lock.json
	mv -f package.json package.json.old || true
	npm init -y
	sed -i '/^  "scripts": {/a\    "build": "make build",' package.json
	sed -i 's/"license": "ISC"/"license": "UNLICENSED"/' package.json
	sed -i 's/"author": ""/"author": "$(EMAIL)"/' package.json
	npm install --save-dev @11ty/eleventy
	npm install --save-dev @11ty/eleventy-navigation
	npm install --save-dev markdown-it
	npm install --save-dev markdown-it-attrs
	npm install --save-dev markdown-it-bracketed-spans
	npm install --save-dev markdown-it-div
