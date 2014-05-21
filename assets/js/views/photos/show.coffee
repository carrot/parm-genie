define ['app', 'views/comments/comments', 'views/ratings/ratings'], (App, CommentsView, RatingsView) ->

  class PhotoShowView extends Marionette.ItemView

    template: App.Template '/photos/show'
    tagName: 'article'
    className: 'photo'

    render: ->
      super()

      # get comments
      commentsView = new CommentsView(parent: @model)
      commentsView.setElement(@$el.find('.comments')).render()

      # get ratings
      ratingsView = new RatingsView(parent: @model)
      ratingsView.setElement(@$el.find('.ratings')).render()

    events:
      "submit form.rating": "postRating"

    postRating: (e) ->
      e.preventDefault()
      App.Controllers.ratings.create(@model, @$('[name="rating"]').val())
        .then @render

    templateHelpers: ->

      user: => @model.get('user').toJSON()
      rating: => @model.getAverageRating()
      userHasRated: =>
        _.contains(_.map(@model.get('ratings'), (rating) -> rating.get('user').id), App.User().id)
