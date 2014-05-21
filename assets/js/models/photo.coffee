define ['app', 'models/rating', 'models/comment'], (App, Rating, Comment) ->

  Parse.Object.extend 'Photo',

    defaults:
      ratings: []
      comments: []

    rate: (user, rating) ->
      ratings = @get('ratings')
      rating = new Rating photo: @, user: user, rating: rating
      ratings.push rating
      @set 'ratings', ratings

    comment: (user, comment) ->
      comments = @get('comments')
      comment = new Comment photo: @, user: user, comment: comment
      comments.push comment
      @set 'comments', comments

    getAverageRating: ->
      ratings = _.map @get('ratings'), (o) -> o.get('rating')
      total = (ratings.reduce (a, b) -> parseFloat(a) + parseFloat(b)) if ratings.length
      (total / ratings.length) || 0
