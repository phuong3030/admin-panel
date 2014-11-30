define(
  [
    'app', 
    'views/shared/sidebar/left/left_navbar_tabs_menu-view'
  ], 
  function (App, NavbarTabsMenuView) {

    return Backbone.Marionette.Controller.extend({
      // Create right header menu
      createNavbarTabsMenu: function () {
      
        var navbarTabsMenu = new NavbarTabsMenuView();
        
        App.leftSidebarRegion.attachView(navbarTabsMenu);
      }   
    });
  }
);
