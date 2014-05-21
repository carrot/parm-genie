define ['app', 'models/rating', 'models/photo'], (App, Rating, Photo) ->

  create: (photo, rating) ->
    photo.rate App.User(), rating
    photo.save()
