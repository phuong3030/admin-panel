define(
  ['app', 'controllers/shared/sidebar/left/left_sidebar-controller'], 
  function (App, LeftSidebarController) {

  App.module('LeftSidebar', function (LeftSidebarApp, App, Backbone, Marionette, $, _) {

    'use strict';

    LeftSidebarApp.addInitializer(function () {

      // Init left sidebar's items
      require(
        [
          'controllers/shared/sidebar/left/left_navbar_tabs_menu-controller',
          'controllers/shared/sidebar/left/left_navbar_menu-controller',
          'controllers/shared/sidebar/left/left_navbar_bottom-controller'
        ],
        function (TabsMenuController, MenuController, BottomWidgetController) {

          var tabsMenuController = new TabsMenuController(),
              menuController = new MenuController(),
              bottomWidgetController = new BottomWidgetController();

          tabsMenuController.createNavbarTabsMenu();
          menuController.createNavbarMenu();
          bottomWidgetController.createBottomWidget();

          // Listen application event and send to correct view
          tabsMenuController.bindEvent();
          menuController.bindEvent();
        }
      );
    
    });
  });
});
