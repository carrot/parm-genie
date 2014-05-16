define ['app'], (App) ->

  class PhotoView extends Marionette.ItemView

    template: App.Template '/photos/photo'
    tagName: 'article'
    className: 'photo'

    serializeData: ->
      return this.model.toJSON()
