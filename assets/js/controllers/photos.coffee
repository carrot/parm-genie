define [

  "app",
  "models/photo",
  "views/photos/index",
  "views/photos/new"

], (App, Photo, PhotosIndexView, PhotosNewView, Syphon) ->

  index: ->

    @query = new Parse.Query Photo
    @query.collection().fetch
      success: (collection) ->
        App.main.show new PhotosIndexView(collection: collection)

  new: ->
    App.main.show new PhotosNewView()

  create: (files) ->
    if files.length
      for file in files
        # make sure the file is an image FIXME: move to model
        if /^image/.test file.type
          # create the file
          @file = (new Parse.File file.name, file)
          @file.save().then ->
            @photo = new Photo()
            @photo.set 'photoSrc', @file
            @photo.save().then ->
              App.Go 'photos', 'index'
        else
          alert 'The file needs to be an image'
    else
      alert 'You need to select a file'
