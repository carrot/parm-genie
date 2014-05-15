define [
  'app',
  'views/pages/home',
  'views/pages/dashboard'
], (App, PagesHomeView, PagesDashboardView) ->

  home: ->
    if App.User()
      (new PagesDashboardView()).render()
    else
      (new PagesHomeView()).render()
