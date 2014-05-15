define ['app'], (App) ->

  Parse.Object.extend 'Comment',

    defaults:
      content: "test"
