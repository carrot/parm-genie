define ['app', 'models/rating'], (App, Rating) ->

  Parse.Object.extend 'Photo',

    initialize: ->
      ratings = @get 'ratings'
      @get_average_rating()

    rate: (user, rating, cb) ->
      ratings = @get('ratings') || []
      rating = new Rating
        photo: @
        user: user
        rating: rating
      ratings.push rating
      @set 'ratings', ratings
      @save()
        .then @get_average_rating
        .then cb

    get_average_rating: (cb) ->
      query = new Parse.Query Rating
      query.equalTo 'photo', @id
      query.find()
        .then (results) =>
          ratings = _.pluck results, 'rating'
          console.log ratings
        .then cb
