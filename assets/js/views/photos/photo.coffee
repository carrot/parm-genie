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

      # set user
      @model.set 'user', @model.get('user').toJSON()

      # set ratings
      @model.relation('rating').query().first()
      @model.set 'ratings', @model.get('ratings')

      return @model.toJSON()
