define [

  "app",
  "models/photo",
  "models/comment",
  "views/photos/index",
  "views/photos/new",
  "views/photos/show"

], (App, Photo, Comment, PhotosIndexView, PhotosNewView, PhotosShowView) ->

  index: ->
    @query = new Parse.Query Photo
    # @query.include('user', 'ratings', 'comments').descending('createdAt').collection().fetch()
    @query.include('user', 'ratings').descending('createdAt').collection().fetch()
      .then (collection) ->
        App.main.show new PhotosIndexView(collection: collection)

  new: ->
    App.main.show new PhotosNewView()

  show: (id) ->
    @query = new Parse.Query Photo
    @query.include('user', 'ratings', 'comments').get(id)
      .then (photo) ->
        App.main.show new PhotosShowView(model: photo)

  create: (files) ->
    if files.length
      for file in files
        # make sure the file is an image FIXME: move to model
        if /^image/.test file.type
          # create the file
          @file = (new Parse.File file.name, file)
          @file.save
            success: (file) ->
              @photo = new Photo()
              @photo.set
                 src: file
                 user: App.User()
              @photo.save().then ->
                App.Go 'photos', 'index'
        else
          alert 'The file needs to be an image'
    else
      alert 'You need to select a file'
