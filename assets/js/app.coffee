define [

  'backbone',
  'marionette',
  'parse',
  'facebook',
  './routes',
  './config',
  './templates'

], (Backbone, Marionette, Parse, FB, Routes, Config, Templates) ->

  # instantiate Marionette.Application
  App = new Marionette.Application()
  App.Config = Config
  App.Routes = Routes
  App.Templates = Templates
  App.Routers = {}

  # initialize Parse
  Parse.initialize App.Config.parse.application_id, App.Config.parse.javascript_key

  # helper function
  App.User = Parse.User.current

  # if facebook app ID is in configuration,
  # initialize FB and Parse.FacebookUtils
  if App.Config.facebook

    FB.init
      appId: App.Config.facebook.application_id

    Parse.FacebookUtils.init
      appId: App.Config.facebook.application_id
      status: true
      cookie: true
      xfbml: true

  # function to grab a route by
  # its controller and action.
  App.Route = (controller, action) ->
    routes = App.Routes[controller]
    route = null
    _.each _.keys(routes), (key) ->
      route = key if routes[key] == action
    "\##{route}" if route

  # function to grab a template
  # with helper locals.
  App.Template = (path, locals) ->
    App.Templates[path] _.extend(
      locals or {},
      { config: App.Config },
      { route: App.Route },
      current_user: App.User
    )

  # a redirect function
  App.Go = (controller, action) ->

    # run the controller method
    App.Routers[controller].options.controller[action](_.values(arguments).slice(2))

    # pushState
    Backbone.history.navigate App.Route(controller, action)

  # grab all controllers specified in `routes.coffee`
  # and instantiate routers for each. finally,
  # start Backbone.history.
  App.addInitializer ->
    require _.map(_.keys(App.Routes), (name) -> "controllers/#{name}"), ->
      for key, controller of arguments
        App.Routers[_.keys(App.Routes)[key]] = new Marionette.AppRouter
          controller: arguments[key]
          appRoutes: _.values(App.Routes)[key]
      Backbone.history.start() if Backbone.history

  # return app instance
  App
