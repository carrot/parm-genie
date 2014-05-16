define ['app', 'views/photos/photo'], (App, PhotoView) ->

  class PhotoIndexView extends Marionette.CompositeView

    template: App.Template '/photos/index'
    itemView: PhotoView
    itemViewContainer: '.photos'
