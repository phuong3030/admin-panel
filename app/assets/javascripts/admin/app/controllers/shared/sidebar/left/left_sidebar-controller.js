/*
 * LeftSidebar Controller 
 *
 * Initialize LeftSidebar module to create left sidebar html structure
 * Create and manage events from partial item in left sidebar
 */ 
define(['app', 'views/layouts/left_sidebar-layout'], function (App, LeftSidebarLayout) {

  App.module(
    'LeftSidebar.LeftSidebarController', 
    function (LeftSidebarController, App, Backbone, Marionette) {

      'use strict';

      LeftSidebarController.Controller = Backbone.Marionette.Controller.extend({
        createLeftSidebarLayout: function () {
          
          var leftSidebarLayout = new LeftSidebarLayout();

          // Initialize header html structure
          App.leftSidebarRegion.show(leftSidebarLayout); 
          // Store header pointer to create header's items later
          App.leftSidebarLayout = leftSidebarLayout;
        }
      });

      LeftSidebarController.addInitializer(function () {
        
        /*
        * Always init header layout immediately to
        * ensure it exisits before it's item
        */ 
        var leftSidebarController  = new LeftSidebarController.Controller();

        leftSidebarController.createLeftSidebarLayout();
      });
    }
  );

  return App.module('LeftSidebar.LeftSidebarController').Controller;
});
