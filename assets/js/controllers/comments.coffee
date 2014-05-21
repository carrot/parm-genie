define [

  'app',
  'models/comment'

], (App, Comment) ->

  create: (photo, comment) ->
    photo.comment(App.User(), comment) if comment.length
    photo.save()
