/* 
 * Client application
 * 
 * This object define and store all application regions
 * Define an object to store all model (apply the fly-weight patter)
 *
 */

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

    // Application regions pre-defined
    App.addRegions({
      application: 'body',
      header: 'header',
      leftSidebar: '#left-sidebar-wrapper',
      rightSidebar: '#right-sidebar-wrapper',
      headSection: '#head-section',
      titleSection: '#title-section',
      content: '#content-section'
    });

    // Define the fly weight storage
    App.flyWeight = {};

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

    // Start the hash listener, main router and sub-router
    App.on('start', function () {

      if (Backbone.history) {

        // Init all subapp router before start hash change listener
        require(['routers/room-router'], function () {

          Backbone.history.start({ pushState: true });
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
