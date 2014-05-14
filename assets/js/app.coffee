define ['jquery', 'underscore', 'routes'], ($, _, Routes) ->

  App = new Marionette.Application()

  App.addInitializer ->

    require _.map(_.keys(Routes), (name) -> "controllers/#{name}"), ->

      for key, controller of arguments
        new Marionette.AppRouter
          controller: arguments[key]
          appRoutes: _.values(Routes)[key]

      Backbone.history.start(pushState: true) if Backbone.history
      
  return App
