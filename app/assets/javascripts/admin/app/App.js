define(
  [
    'jquery', 
    'backbone', 
    'marionette', 
    'underscore', 
    'handlebars'
  ],
  function ($, Backbone, Marionette, _, Handlebars) {

    var App = new Backbone.Marionette.Application();

    function isMobile() {

      var userAgent = navigator.userAgent || navigator.vendor || window.opera;
      return ((/iPhone|iPod|iPad|Android|BlackBerry|Opera Mini|IEMobile/).test(userAgent));
    }

    // Organize Application into regions corresponding to DOM elements
    // Regions can contain views, Layouts, or subregions nested as necessary
    App.addRegions({
      headerRegion: 'header',
      leftSidebarRegion: '#sidebar-left',
      rightSidebarRegion: '#sidebar-right',
      headSection: '#head-section',
      headTitle: '#head-title',
      content: '#content-section'
    });

    // Start subApp manually when routes change
    App.startSubApp = function (appName, args) {

      var currentApp = appName ? App.module(appName) : null;

      if (App.currentApp === currentApp) {

        return;
      }

      if (App.currentApp) {

        App.currentApp.stop();
      }

      App.currentApp = currentApp;
      if (currentApp) {

        currentApp.start(args);
      }
    };

    App.on('start', function () {

      if (Backbone.history) {

        require(['routers/taxonomy'], function () {

          Backbone.history.start();
        });
      }
    });

    App.mobile = isMobile();

    return App;
  }
);
