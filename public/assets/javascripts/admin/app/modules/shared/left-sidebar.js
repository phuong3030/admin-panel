define(
  [
    'app',
    'views/layouts/left-sidebar' 
  ], 
  function (App, LeftSidebarLayout) {

  App.module('LeftSidebar', function (LeftSidebarApp, App, Backbone, Marionette, $, _) {

    'use strict';

    LeftSidebarApp.addInitializer(function () {

      this.leftSidebar = new LeftSidebarLayout();
      App.leftSidebarRegion.show(this.leftSidebar);
    });
  });
});
