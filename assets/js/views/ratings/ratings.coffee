define ['app', 'views/ratings/rating'], (App, RatingView) ->

  class RatingsView extends Marionette.CompositeView

    template: App.Template '/ratings/ratings'
    itemView: RatingView
    itemViewContainer: 'ul'

    initialize: (opts) ->
      @model = opts.parent
      @collection = new Parse.Collection(@model.get('ratings'))
