/*
 * Header Layout
 *
 * Use for render header html struture
 */
define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'hbs!templates/layouts/header'
  ],
  function (App, Backbone, Marionette, $, headerTemplate) {

    return Backbone.Marionette.LayoutView.extend( {
      template: headerTemplate,

      ui: {
        wrapper: 'header'
      },

      regions: {
        panelHeaderRegion: '.panel-header',
        menuSearchRegion: '.menu-search',
        megaMenuRegion: '.mega-menu-wrapper'
      },

      // View Event Handlers
      events: {

      }
    });
  }
);
