// 11ty configuration
module.exports = function(config) {
    config.addPassthroughCopy('./src/css/');
    config.addPassthroughCopy('./src/js/');
    config.addPassthroughCopy('./src/images/');

    // We want the attrs and bracketed-spans extensions
    let markdownIt = require("markdown-it");
    config.setLibrary("md",
                      markdownIt({ html: true })
                      .use(require("markdown-it-attrs"))
                      .use(require('markdown-it-div'))
                      .use(require("markdown-it-bracketed-spans")));

    return {
        markdownTemplateEngine: "njk",
        htmlTemplateEngine: "njk",
        dir: {
            input: 'src'
            //output: 'docs'  // default: _site
        }
    };
};
