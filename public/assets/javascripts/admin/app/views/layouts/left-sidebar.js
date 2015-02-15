define(
  [
    'app',
    'backbone',
    'marionette',
    'jquery',
    'hbs!templates/layouts/left-sidebar'
  ],
  function (App, Backbone, Marionette, $, leftSidebarTemplate) {

    return Backbone.Marionette.LayoutView.extend({
      template: leftSidebarTemplate,
      className: 'left-sidebar',

      regions: {
        tabsMenuRegion: '.navbar-tabs-menu',
        navbarMenuRegion: '.navbar-menu-wrapper',
        bottomWidgetRegion: '.navbar-bottom-widget'
      }
    });
  }
);
