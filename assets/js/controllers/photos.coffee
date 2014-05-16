define [

  "app",
  "models/photo"

], (App, Photo) ->

  index: ->
    @photos = Parse.Collection.extend model: Photo
    @query = new Parse.Query @photos
    @query.descending "createdAt"
    @query.find
      success: (results) ->
        console.log results

  new: ->

  create: ->
