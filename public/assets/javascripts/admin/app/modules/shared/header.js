define(
  [
    'app',
    'views/layouts/header'
  ], 
  function (App, HeaderLayout) {

    App.module("Header", function (HeaderApp, App, Backbone, Marionette, $, _) {

      'use strict';

      // Ensure header is always created
      HeaderApp.addInitializer(function () {

        this.headerLayout = new HeaderLayout();
        App.headerRegion.show(this.headerLayout);
      });
    });
  }
);
