define(
  ['app', 'controllers/shared/header/header-controller'], 
  function (App, HeaderController) {

    App.module("Header", function (HeaderApp, App, Backbone, Marionette, $, _) {

      "use strict";

      // Ensure header is always created
      HeaderApp.addInitializer(function () {

        /*
         * Create mega menu controller instance to draw mega menu and
         * listen all event from app sent to mega menu 
         */
        require(
          ['controllers/shared/header/mega_menu-controller'], 
          function (MegaMenuController) {
            
            var megaMenuController = new MegaMenuController();

            megaMenuController.createMegaMenu();
          }
        );

        /*
         * Create menu search controller instance to draw menu search and
         * listen all event from app sent to menu search
         */
        require(
          ['controllers/shared/header/menu_search-controller'], 
          function (MenuSearchController) {
        
            var menuSearchController = new MenuSearchController();

            menuSearchController.createMenuSearch();
          }
        );

        /*
         * Create menu search controller instance to draw panel header and
         * listen all event from app sent to panel header
         */
        require(
          ['controllers/shared/header/panel_header-controller'], 
          function (PanelHeaderController) {
        
            var panelHeaderController = new PanelHeaderController();

            panelHeaderController.createPanelHeader();
          }
        );
      });
    });
  }
);
