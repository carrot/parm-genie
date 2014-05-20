define ['app'], (App) ->

  class PhotoView extends Marionette.ItemView

    template: App.Template '/photos/photo'
    tagName: 'article'
    className: 'photo'

    events:
      "submit form": "rate"

    rate: (e) ->
      e.preventDefault()
      App.Controllers.ratings.create @model, @$('[name="id"]').val(), @$('[name="rating"]').val()
      @model.save success: @render

    serializeData: ->
      @model.toNestedJSON 'user', 'ratings'

    templateHelpers: ->
      averageRating: => @model.getAverageRating()
      userHasRated: =>
        _.contains(_.map(@model.get('ratings'), (rating) -> rating.get('user').id), App.User().id)
