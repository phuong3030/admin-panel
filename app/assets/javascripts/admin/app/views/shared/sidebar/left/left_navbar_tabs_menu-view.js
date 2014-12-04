/*
 * Navbar tabs menu 
 *
 * Render navbar tabs menu
 */
define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'hbs!templates/shared/sidebar/left/left_navbar_tabs_menu'
  ],
  function (App, Backbone, Marionette, $, navbarTabsMenuTemplate) {

    return Backbone.Marionette.LayoutView.extend( {
      template: navbarTabsMenuTemplate,
      className: 'navbar-tabs-menu-container',

      // View Event Handlers
      events: {

      }
    });
  }
);
