define(
  ['app'], 
  function (App) {

    App.module("Header", function (HeaderApp, App, Backbone, Marionette, $, _) {

      'use strict';

      // Ensure header is always created
      HeaderApp.addInitializer(function () {

        }
      );
    });
  }
);
