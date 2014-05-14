require.config

  paths:
    jquery: '//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min'
    underscore: '//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.6.0/underscore-min'
    backbone: '//cdnjs.cloudflare.com/ajax/libs/backbone.js/1.1.2/backbone-min'
    marionette: '//cdnjs.cloudflare.com/ajax/libs/backbone.marionette/1.8.0/backbone.marionette.min'
    app: 'app'

  shim:
    backbone:
      deps: ['jquery', 'underscore']
      exports: 'Backbone'
    marionette:
      deps: ['backbone']
      exports: 'Marionette'

require ['jquery', 'underscore', 'backbone', 'marionette', 'app'], ($, _, Backbone, Marionette, App) ->

  $ -> App.start()
