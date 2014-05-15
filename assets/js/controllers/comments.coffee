define ['models/comment'], (Comment) ->

  new: ->
    @comment = new Comment()
    console.log "New comment"
