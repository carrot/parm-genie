axis         = require 'axis-css'
autoprefixer = require 'autoprefixer-stylus'
rupture      = require 'rupture'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore']

  stylus:
    use: [axis(), autoprefixer(), rupture()]

  extensions: [
    require('js-pipeline')(
      files: [
        "assets/js/application.coffee",
        "assets/js/models/*.coffee",
        "assets/js/routers/*.coffee",
        "assets/js/views/*.coffee"
      ],
      out: 'js/build.js',
      minify: false
    )
  ]
