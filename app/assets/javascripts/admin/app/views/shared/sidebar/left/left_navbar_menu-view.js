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
    'hbs!templates/shared/sidebar/left/left_navbar_menu'
  ],
  function (App, Backbone, Marionette, $, navbarMenuTemplate) {

    return Backbone.Marionette.LayoutView.extend( {
      template: navbarMenuTemplate,
      className: 'navbar-menu',

      // View Event Handlers
      events: {

      }
    });
  }
);
