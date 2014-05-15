define ['app', 'parse', 'controllers/pages'], (App, Parse, PagesController) ->

  destroy: ->
    if App.User()
      Parse.User.logOut()

    App.Go 'pages', 'home'

  facebook: ->
    if !App.User()
      Parse.FacebookUtils.logIn null,
        success: ->
          App.Go 'pages', 'home'
    else
      App.Go 'pages', 'home'
