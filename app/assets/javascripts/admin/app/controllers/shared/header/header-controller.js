/*
 * Header Controller 
 *
 * Initialize HeadController module to create header html structure
 * Create and manage events from partial item in header
 */ 
define(['app', 'views/header/header-layout'], function (App, HeaderLayout) {

  App.module('Header.HeaderController', function (HeaderController, App, Backbone, Marionette) {

    HeaderController.Controller = Backbone.Marionette.Controller.extend({
    
      // Create mega menu
      createMegaMenu: function () {

        /*
         * Create mega menu controller instance to draw mega menu and
         * listen all event from app sent to mega menu 
         */
        require(
          ['controllers/shared/header/mega_menu-controller'], 
          function (MegaMenuController) {
            
            var megaMenuController = new MegaMenuController();
          }
        );
      }, 
    
      // Create menu search 
      createMenuSearch: function () {

        /*
         * Create menu search controller instance to draw menu search and
         * listen all event from app sent to menu search
         */
        require(
          ['controllers/shared/header/menu_search-controller'], 
          function (MenuSearchController) {
        
            var menuSearchController = new MenuSearchController();
          }
        );
      },

      // Create panel header
      createPanelHeader: function () {

        /*
         * Create menu search controller instance to draw panel header and
         * listen all event from app sent to panel header
         */
        require(
          ['controllers/shared/header/panel_header-controller'], 
          function (PanelHeaderController) {
        
            var panelHeaderController = new PanelHeaderController();
          }
        );
      },
    });

    HeaderController.addInitializer(function () {
      
      var headerLayout = new HeaderLayout();

      // Initialize header html structure
      App.headerRegion.show(headerLayout); 
      // Store header pointer to create header's items later
      App.headerLayout = headerLayout;
    });
  });

  return App.module('Header.HeaderController').Controller;
});
