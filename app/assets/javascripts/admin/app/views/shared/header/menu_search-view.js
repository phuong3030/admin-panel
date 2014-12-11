/*
 * Menu Search View
 *
 * Use for render mega menu in header
 */
define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'hbs!templates/shared/header/menu_search'
  ],
  function (App, Backbone, Marionette, $, menuSearchTemplate) {

    return Backbone.Marionette.ItemView.extend( {
      template: menuSearchTemplate,
      className: 'menu-search',

      // View Event Handlers
      events: {

      }
    });
  }
);
