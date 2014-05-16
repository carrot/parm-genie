define [

  "app",
  "models/photo",
  "views/photos/index"

], (App, Photo, PhotosIndexView) ->

  index: ->

    @collection = Parse.Collection.extend
      model: Photo
      query: new Parse.Query Photo

    @photos = new @collection
    @photos.fetch()

    App.main.show new PhotosIndexView(collection: @collection)

  new: ->

  create: ->
