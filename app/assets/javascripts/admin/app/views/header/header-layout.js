/*
 * Header View
 *
 * Use for render header html struture
 */
define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'hbs!templates/shared/header/header'
  ],
  function (App, Backbone, Marionette, $, headerTemplate) {

    return Backbone.Marionette.LayoutView.extend( {
      template: headerTemplate,

      regions: {
        panelHeaderRegion: '.top-nav',
        menuSearchRegion: '.menu-search',
        megaMenuRegion: '.mega-menu-wrapper'
      },

      // View Event Handlers
      events: {

      }
    });
  }
);
