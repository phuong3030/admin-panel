/*
 * Navbar bottom widget view
 *
 * Render left sidebar bottom widget
 */
define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'hbs!templates/shared/sidebar/left/left_navbar_bottom_widget'
  ],
  function (App, Backbone, Marionette, $, navbarBottomWidget) {

    return Backbone.Marionette.LayoutView.extend( {
      template: navbarBottomWidget,

      // View Event Handlers
      events: {

      }
    });
  }
);
