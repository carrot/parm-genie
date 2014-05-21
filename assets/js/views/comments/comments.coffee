define ['app', 'views/comments/comment'], (App, CommentView) ->

  class CommentsView extends Marionette.CompositeView

    template: App.Template '/comments/comments'
    itemView: CommentView
    itemViewContainer: 'ul'

    events:
      "submit form": "post"

    initialize: (opts) ->
      @model = opts.parent
      @collection = new Parse.Collection(@model.get('comments'))

    post: (e) ->
      e.preventDefault()
      App.Controllers.comments.create(@model, @$('[name="comment"]').val())
        .then =>
          @collection = new Parse.Collection(@model.get('comments'))
          @render()
