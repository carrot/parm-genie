define ['app', 'parse', 'controllers/pages'], (App, Parse, PagesController) ->

  destroy: ->
    if App.User()
      Parse.User.logOut()

    App.Go 'pages', 'home'

  facebook: ->
    if !App.User()
      Parse.FacebookUtils.logIn 'public_profile',
        success: (user) ->
          FB.api '/me', 'get', (info) ->
            App.User().set 'name', info.name
            App.User().set 'url', info.link
            App.User().save()
            App.Go 'pages', 'home'
    else
      App.Go 'pages', 'home'
