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

    App.addRegions({
      applicationRegion: 'body',
      headerRegion: 'header',
      leftSidebarRegion: '#left-sidebar-wrapper',
      rightSidebarRegion: '#right-sidebar-wrapper',
      headSectionRegion: '#head-section',
      headTitleRegion: '#title-section',
      contentRegion: '#content-section'
    });

    // Start subApp manually when subapp change
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

        // Init all subapp router before start hash change listener
        require(['routers/room-router'], function () {

          Backbone.history.start();
        });
      }
    });

    App.mobile = isMobile();

    // Init ajax csrf token
    $.ajaxSetup({
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      }
    });

    return App;
  }
);
