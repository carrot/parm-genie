define ['marionette', 'controllers/sessions'], (Marionette, SessionsController)->

  class SessionsRouter extends Marionette.AppRouter

    controller: SessionController

    appRoutes:
      "in": "new"
