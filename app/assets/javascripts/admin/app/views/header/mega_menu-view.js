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
    'hbs!templates/shared/header/mega_menu'
  ],
  function (App, Backbone, Marionette, $, megaMenuTemplate) {

    return Backbone.Marionette.ItemView.extend( {
      template: megaMenuTemplate,

      // View Event Handlers
      events: {

      }
    });
  }
);
