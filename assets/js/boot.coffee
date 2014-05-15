require.config

  paths:
    jquery: '//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min'
    underscore: '//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.6.0/underscore-min'
    backbone: '//cdnjs.cloudflare.com/ajax/libs/backbone.js/1.1.2/backbone-min'
    marionette: '//cdnjs.cloudflare.com/ajax/libs/backbone.marionette/1.8.0/backbone.marionette.min'
    facebook: '//connect.facebook.net/en_US/all'
    parse: '//www.parsecdn.com/js/parse-1.2.18.min'

  shim:
    marionette:
      deps: ['backbone']
      exports: 'Marionette'
    parse:
      exports: 'Parse'
    facebook:
      exports: 'FB'

require [

  'jquery',
  './app'

], ($, App) ->

  $ -> App.start()
