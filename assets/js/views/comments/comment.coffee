define ['app'], (App) ->

  class CommentView extends Marionette.ItemView

    template: App.Template '/comments/comment'
    tagName: 'li'

    render: ->
      @model.get('user').fetch success: => super()

    templateHelpers: ->
      user: => @model.get('user').toJSON()
