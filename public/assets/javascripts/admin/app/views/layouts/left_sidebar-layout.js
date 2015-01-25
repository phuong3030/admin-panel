/*
 * Left sidebar Layout
 *
 * Use for render header html struture
 */
define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'hbs!templates/layouts/left_sidebar'
  ],
  function (App, Backbone, Marionette, $, headerTemplate) {

    return Backbone.Marionette.LayoutView.extend( {
      template: headerTemplate,
      className: 'left-sidebar',

      regions: {
        tabsMenuRegion: '.navbar-tabs-menu',
        navbarMenuRegion: '.navbar-menu-wrapper',
        bottomWidgetRegion: '.navbar-bottom-widget'
      },

      // View Event Handlers
      events: {

      }
    });
  }
);
