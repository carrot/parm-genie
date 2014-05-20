define [

  'backbone',
  'marionette',
  'parse',
  'facebook',
  './routes',
  './config',
  './templates'

], (Backbone, Marionette, Parse, FB, Routes, Config, Templates) ->

  if !window.App

    # instantiate Marionette.Application
    App = new Marionette.Application()
    App.Config = Config
    App.Routes = Routes
    App.Templates = Templates
    App.Routers = {}
    App.Controllers = {}

    # initialize regions in configuration
    App.addRegions App.Config.regions if App.Config.regions

    # start up Parse
    if App.Config.parse
      # initialize parse
      Parse.initialize App.Config.parse.application_id, App.Config.parse.javascript_key

      Parse.Object.prototype.toNestedJSON = ->
        json = @toJSON()
        for argument in arguments
          relation = @get argument
          if relation instanceof Array
            json[argument] = []
            for item in relation
              json[argument].push item.toJSON()
          else if typeof relation == 'object'
            json[argument] = relation.toJSON()
        return json

    # if facebook app ID is in configuration,
    # initialize FB and Parse.FacebookUtils
    if App.Config.facebook

      Parse.FacebookUtils.init
        appId: App.Config.facebook.application_id

    # add user to main object
    App.User = ->
      Parse.User.current()

    # function to grab a route by
    # its controller and action.
    App.Route = (controller, action) ->
      routes = App.Routes[controller]
      route = null
      _.each _.keys(routes), (key) ->
        route = key if routes[key] == action
      "\#\/#{route}" if route

    # function to grab a template
    # with helper locals.
    App.Template = (path) ->
      (data) ->
        App.Templates[path] _.extend data,
          config: App.Config,
          route: App.Route,
          current_user: App.User

    # a redirect function
    App.Go = (controller, action) ->
      App.Routers[controller].navigate App.Route(controller, action), { trigger: true }

    # grab all controllers specified in `routes.coffee`
    # and instantiate routers for each. finally,
    # start Backbone.history.
    App.addInitializer ->
      require _.map(_.keys(App.Routes), (name) -> "controllers/#{name}"), ->
        for key, controller of arguments
          name = _.keys(App.Routes)[key]
          controller = arguments[key]
          App.Controllers[name] = controller
          App.Routers[name] = new Marionette.AppRouter
            controller: controller
            appRoutes: _.values(App.Routes)[key]
        Backbone.history.start() if Backbone.history

    # attach app to window
    window.App = App

  # return app instance
  window.App
