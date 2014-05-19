define ['app', 'models/rating', 'models/photo'], (App, Rating, Photo) ->

  create: (pid, rating) ->
    @query = new Parse.Query Photo
    @query.get pid,
      success: (photo) ->
        @query = new Parse.Query Rating
        @query.equalTo 'user', App.User()
        @query.equalTo 'photo', photo
        @query.find
          success: (ratings) ->
            if !ratings.length
              @rating = new Rating
                user: App.User()
                photo: photo
                rating: rating
              @rating.save
                success: ->
                  console.log window
