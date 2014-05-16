define ['views/photos/_photo'], (PhotoView) ->

  class PhotosIndexView extends Marionette.CollectionView

    itemView: PhotoView
