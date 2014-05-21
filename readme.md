parm-genie
==========

This is an demonstrative app built using the PARM ([PArse](http://parse.com), [Roots](https://github.com/jenius/roots), [Marionette](https://github.com/marionettejs/backbone.marionette)) stack.  

It demonstrates an experimental convention for developing PARM apps heavily inspired by [rails](https://github.com/rails/rails).

- The app is [architected](assets/js) in a strict [MVC](http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) pattern.

  ```
  ├── assets
  │   ├── css
  │   ├── img
  │   └── js
  │       ├── models
  │       └── views
  │       ├── controllers
  │       ├── app.coffee
  │       ├── boot.coffee
  │       ├── config.coffee
  │       ├── routes.coffee
  ├── templates
  ├── views
  ├── app.coffee
  ├── package.json
  ├── readme.md
  ```

  - **/js**:
    - **/models**: `Parse.Object` classes.
    - **/controllers**: Objects with methods (actions) to direct the app once a route is hit (instantiate a view, save a `Parse.Object`)
    - **/views**: `Backbone.View` classes (include `Marionette.ItemView`, `Marionette.CompositeView`, etc.)
  - **/views**: Templates to be compiled and output.
  - **/templates**: Templates to be precompiled via [roots-client-templates](https://github.com/carrot/roots-client-templates)

- [app.coffee](assets/js/app.coffee) bootstraps the entire app; `App` is added of the `window` object on instantiation.
- [boot.coffee](assets/js/boot.coffee) requires the dependencies and instantiates the app.
- Routes are defined in [routes.coffee](assets/js/routes.coffee) like so:

  ```coffeescript
  "controller":
    "routes/to/action": "action"
  ```

  The app will instantiate a router for each controller and store it in `App.Routers`.
  > Of note: controllers are stored in `App.Controllers` only if they are defined in `routes.coffee`.

- Configuration settings are defined in [config.coffee](assets/js/config.coffee).
- The app provides a few helper methods available in the `App` object:
  - **App.Template()** to grab a precompiled template.  Using App.Template is much like using `_.template`; it includes the following helpers by default:
    - **config**: `App.Config`
    - **current_user**: `App.User`
    - **route**: `App.Route`
  - **App.User()** to grab the current user via Parse.
  - **App.Route(controller, action)** to grab a route via its controller and action.
  - **App.Go()** to redirect to an action.

- Rails-inspired nomenclature and folder hierarchy.

  ```
  ├── controllers
  │   ├── photos.coffee
  ├── models
  │   ├── photo.coffee
  └── views
      └── photos
          ├── index.coffee
          ├── new.coffee
          └── photo.coffee
  ```

## License

- Details on the license [can be found here](LICENSE).
