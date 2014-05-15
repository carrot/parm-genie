define ['app', 'models/comment'], (App, Comment) ->

  new: ->
    @comment = new Comment()
