define ['app'], (App) ->

  class PhotosNewView extends Marionette.ItemView

    template: App.Template '/photos/new'
    events:
      "submit form": "save"

    save: (e) ->
      e.preventDefault()
      App.Controllers.photos.create @$('input')[0].files
