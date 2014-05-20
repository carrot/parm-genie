define ['app', 'models/rating', 'models/photo'], (App, Rating, Photo) ->

  create: (model, pid, rating) ->
    model.rate App.User(), rating
    model.save()
