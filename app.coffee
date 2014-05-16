axis         = require 'axis-css'
autoprefixer = require 'autoprefixer-stylus'
rupture      = require 'rupture'
precompile   = require 'client-templates'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore']
  watcher_ignores: ['node_modules']

  stylus:
    use: [axis(), autoprefixer(), rupture()]

  extensions: [
    precompile(base: './templates', out: 'js/templates.js')
  ]
