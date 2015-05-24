define(
  [
    'app',
    'views/shared/main-content/head-section'
  ],
  function (App, HeadSection) {

    App.module('MainContent', function (MainContent, App, Backbone, Marionette, $, _) {

      'use strict';

      MainContent.addInitializer(function () {

        this.headSection = new HeadSection();
        App.headSection.show(this.headSection);
      });
    });
  }
);
