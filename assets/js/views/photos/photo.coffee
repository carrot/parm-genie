define ['app', 'views/comments/comments'], (App, CommentsView) ->

  class PhotoView extends Marionette.ItemView

    template: App.Template '/photos/photo'
    tagName: 'article'
    className: 'photo'

    render: ->
      super()
      commentsView = new CommentsView(parent: @model)
      commentsView.setElement(@$el.find('.comments')).render()

    events:
      "submit form.rating": "rating"

    rating: (e) ->
      e.preventDefault()
      App.Controllers.ratings.create(@model, @$('[name="rating"]').val())
        .then @render

    templateHelpers: ->

      user: => @model.get('user').toJSON()
      rating: => @model.getAverageRating()
      userHasRated: =>
        _.contains(_.map(@model.get('ratings'), (rating) -> rating.get('user').id), App.User().id)
