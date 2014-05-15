define ['app'], (App) ->

  class PagesHomeView extends Backbone.View

    template: App.Template '/pages/home'
    el: 'body'

    render: ->
      this.$el.html this.template
