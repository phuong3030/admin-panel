define(
  ['app', 'controllers/shared/header/header-controller'], 
  function (App, HeaderController) {

    App.module("Header", function (HeaderApp, App, Backbone, Marionette, $, _) {

      "use strict";

      // Ensure header is always created
      HeaderApp.addInitializer(function () {

        /*
         * Create mega menu, menu search, panel header controller instance to 
         * draw mega menu and listen all event from app sent to mega menu 
         */
        require(
          [
            'controllers/shared/header/mega_menu-controller',
            'controllers/shared/header/menu_search-controller',
            'controllers/shared/header/panel_header-controller'
          ], 
          function (MegaMenuController, MenuSearchController, PanelHeaderController) {
            
            var megaMenuController = new MegaMenuController(),
                menuSearchController = new MenuSearchController(),
                panelHeaderController = new PanelHeaderController();

            panelHeaderController.createPanelHeader();
            menuSearchController.createMenuSearch();
            megaMenuController.createMegaMenu();
          }
        );
      });
    });
  }
);
