/*
 * Navbar tabs menu 
 *
 * Render navbar menu
 */
define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'hbs!templates/shared/sidebar/left/right_navbar_menu'
  ],
  function (App, Backbone, Marionette, $, navbarMenuTemplate) {

    return Backbone.Marionette.LayoutView.extend( {
      template: navbarMenuTemplate,

      // View Event Handlers
      events: {

      }
    });
  }
);
