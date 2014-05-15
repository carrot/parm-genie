define ['app'], (App) ->

  class PagesDashboardView extends Backbone.View

    template: App.Template '/pages/dashboard'
    el: 'body'
    
    render: ->
      this.$el.html this.template
