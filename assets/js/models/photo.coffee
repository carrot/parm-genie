define ['app', 'models/rating'], (App, Rating) ->

  Parse.Object.extend 'Photo',

    rate: (user, rating) ->
      ratings = @get('ratings') || []
      rating = new Rating photo: @, user: user, rating: rating
      ratings.push rating
      @set 'ratings', ratings

    getAverageRating: ->
      ratings = _.map @get('ratings'), (o) -> o.get('rating')
      total = ratings.reduce (a, b) -> parseFloat(a) + parseFloat(b)
      total / ratings.length
