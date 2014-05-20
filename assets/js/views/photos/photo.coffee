define ['app'], (App) ->

  class PhotoView extends Marionette.ItemView

    template: App.Template '/photos/photo'
    tagName: 'article'
    className: 'photo'

    events:
      "submit form": "rate"

    rate: (e) ->
      e.preventDefault()
      App.Controllers.ratings.create @$('[name="id"]').val(), @$('[name="rating"]').val()

    serializeData: ->
      @model.toNestedJSON 'user', 'ratings'
