define ['app', 'views/comments/comments'], (App, CommentsView) ->

  class PhotoView extends Marionette.ItemView

    template: App.Template '/photos/photo'
    tagName: 'article'
    className: 'photo'

    templateHelpers: ->

      user: => @model.get('user').toJSON()
      rating: => @model.getAverageRating()
