define [

  'app',
  'views/pages/home',
  'views/pages/dashboard'

], (App, PagesHomeView, PagesDashboardView) ->

  home: ->
    if App.User()
      App.main.show new PagesDashboardView()
    else
      App.main.show new PagesHomeView()
