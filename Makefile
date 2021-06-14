all:
	@echo "Must specify a specific target, e.g. 'make build'"

build:
	npx @11ty/eleventy

# serve up the site at http://localhost:8080/
serve:
	npx @11ty/eleventy --serve

init:
	npm init
	npm install --save-dev @11ty/eleventy
	npm install --save-dev markdown-it-attrs markdown-it-bracketed-spans
