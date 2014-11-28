define(
  ['app', 'controllers/shared/header/header-controller'], 
  function (App, HeaderController) {

    App.module("Header", function (HeaderApp, App, Backbone, Marionette, $, _) {

      "use strict";

      // Ensure header is always created
      HeaderApp.addInitializer(function () {

        var headerController = new HeaderController();

        // Create header's items
        headerController.createPanelHeader();
        headerController.createMenuSearch();
        headerController.createMegaMenu();
      });
    });
  }
);
