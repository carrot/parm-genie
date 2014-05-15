define [

  'backbone',
  'marionette',
  'parse',
  './routes',
  './config',
  './templates'

], (Backbone, Marionette, Parse, Routes, Config, Templates) ->

  # instantiate Marionette.Application
  App = new Marionette.Application()
  App.Config = Config
  App.Routes = Routes
  App.Templates = Templates

  # initialize Parse
  App.on 'initialize:before', ->
    Parse.initialize App.Config.parse.application_id, App.Config.parse.javascript_key

  # grab all controllers specified in `routes.coffee`
  # and instantiate routers for each. finally,
  # start Backbone.history.
  App.addInitializer ->
    require _.map(_.keys(App.Routes), (name) -> "controllers/#{name}"), ->
      for key, controller of arguments
        new Marionette.AppRouter
          controller: arguments[key]
          appRoutes: _.values(App.Routes)[key]
      Backbone.history.start(pushState: true) if Backbone.history

  # return app instance
  App
