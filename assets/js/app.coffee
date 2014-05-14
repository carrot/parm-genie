define ['jquery', 'underscore', 'routes'], ($, _, Routes) ->

  App = new Marionette.Application()

  App.addInitializer ->

    deferred = $.Deferred()

    require _.map(_.keys(Routes), (name) -> "controllers/#{name}"), ->

      for key, controller of arguments
        new Marionette.AppRouter({controller: arguments[key], appRoutes: _.values(Routes)[key]})

      deferred
        .resolve()

    deferred.promise()
      .done ->
        Backbone.history.start(pushState: true) if Backbone.history

  return App
