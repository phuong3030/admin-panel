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
        require(['controllers/header/mega_menu-controller'], function () {
        
          console.log('Mega menu is created');
        });
      }, 
    
      // Create menu search 
      createMenuSearch: function () {

        /*
         * Create menu search controller instance to draw menu search and
         * listen all event from app sent to menu search
         */
        require(['controllers/header/menu_search-controller'], function () {
        
          console.log('Menu search is created');
        });
      },

      // Create panel header
      createPanelHeader: function () {

        /*
         * Create menu search controller instance to draw panel header and
         * listen all event from app sent to panel header
         */
        require(
          ['controllers/header/panel_header-controller'], 
          function (PanelHeaderController) {
        
            var panelHeaderController = new PanelHeaderController();

            panelHeaderController.createPanelHeader();
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
