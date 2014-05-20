define ['app', 'models/rating', 'models/photo'], (App, Rating, Photo) ->

  create: (pid, rating) ->
    @query = new Parse.Query Photo
    @query.get pid,
      success: (photo) ->
        photo.rate App.User(), rating
