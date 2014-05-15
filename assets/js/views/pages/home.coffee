define ['backbone', 'app'], (Backbone, App) ->

  class PagesHomeView extends Backbone.View

    template: App.Templates['/pages/home']
    el: 'body'

    render: ->
      this.$el.html this.template
