define ['app'], (App) ->

  class PagesDashboardView extends Marionette.ItemView

    template: App.Template('/pages/dashboard')

    onRender: ->
      console.log 'rendered Dashboard'

    onClose: ->
      console.log 'closed Dashboard'
