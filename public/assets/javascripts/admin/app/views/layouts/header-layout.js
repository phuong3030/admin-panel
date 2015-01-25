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
      className: 'top-menu-wrapper',

      regions: {
        panelHeaderRegion: '.top-nav',
        menuSearchRegion: '.header-container .col-sm-5.col-xs-12',
        megaMenuRegion: '.mega-menu-wrapper'
      },

      // View Event Handlers
      events: {

      }
    });
  }
);
