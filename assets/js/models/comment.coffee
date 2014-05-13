define ['backbone'], (Backbone) ->

  class Comment extends Backbone.Model

    init: ->
      console.log "Comment initialized."
