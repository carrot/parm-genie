define ['app'], (App) ->

  class PhotosNewView extends Marionette.ItemView

    template: App.Template '/photos/new'
    events:
      "submit form": "save"

    save: (e) ->
      e.preventDefault()
      (require 'controllers/photos').create @$('input')[0].files
