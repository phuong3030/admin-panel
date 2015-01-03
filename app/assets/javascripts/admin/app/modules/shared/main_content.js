define(
  [
    'app', 
    'controllers/shared/main_content/head_section-controller'
  ],
  function (App, HeadSectionController) {

    App.module('MainContent', function (MainContent, App, Backbone, Marionette, $, _) {

      'use strict';

      this.headSectionController = new HeadSectionController();

      MainContent.addInitializer(function () {

        // Create head section when start
        this.headSectionController.createHeadSection();
      });
    });
  }
);
