define(
  [
    'app', 
    'controllers/shared/main_content/head_section-controller',
    'controllers/shared/main_content/title_section-controller'
  ],
  function (App, HeadSectionController, TitleSectionController) {

    App.module('MainContent', function (MainContent, App, Backbone, Marionette, $, _) {

      'use strict';

      this.headSectionController = new HeadSectionController();
      this.titleSectionController = new TitleSectionController();

      MainContent.addInitializer(function () {

        this.headSectionController.createHeadSection();
        this.titleSectionController.createTitleSection();

        this.titleSectionController.bindEvents();
      });
    });
  }
);
