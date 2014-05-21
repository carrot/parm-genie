define ['app'], (App) ->

  class RatingView extends Marionette.ItemView

    template: App.Template '/ratings/rating'
    tagName: 'li'

    render: ->
      @model.get('user').fetch success: => super()

    templateHelpers: ->
      user: => @model.get('user').toJSON()
