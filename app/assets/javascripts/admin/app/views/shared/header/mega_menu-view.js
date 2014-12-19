/*
 * Mega menu View
 *
 * Use for render mega menu in header
 */
define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'models/user',
    'hbs!templates/shared/header/mega_menu'
  ],
  function (App, Backbone, Marionette, $, User, megaMenuTemplate) {

    return Backbone.Marionette.ItemView.extend( {
      template: megaMenuTemplate,
      className: 'mega-menu pull-right',

      initialize: function () {

        this.model = new User({ id: 'my_info' });
        this.model.fetch();
      },

      // View Event Handlers
      events: {

      },

      modelEvents: {
        "sync": "render"
      }
    });
  }
);
