/*
 * Header Controller 
 *
 * Initialize HeadController module to create header html structure
 * Create and manage events from partial item in header
 */ 
define(['app', 'views/shared/header/header-layout'], function (App, HeaderLayout) {

  App.module('Header.HeaderController', function (HeaderController, App, Backbone, Marionette) {

    HeaderController.Controller = Backbone.Marionette.Controller.extend({
      createHeaderLayout: function () {
        
        var headerLayout = new HeaderLayout();

        // Initialize header html structure
        App.headerRegion.show(headerLayout); 
        // Store header pointer to create header's items later
        App.headerLayout = headerLayout;
      }
    });

    HeaderController.addInitializer(function () {
      
      /*
       * Always init header layout immediately to
       * ensure it exisits before it's item
       */ 
      var headerController = new HeaderController.Controller();

      headerController.createHeaderLayout();
    });
  });

  return App.module('Header.HeaderController').Controller;
});
