axis         = require 'axis-css'
autoprefixer = require 'autoprefixer-stylus'
rupture      = require 'rupture'
precompile   = require 'client-templates'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore']

  stylus:
    use: [axis(), autoprefixer(), rupture()]

  extensions: [precompile(base: 'views/templates', out: 'js/templates.js')]
