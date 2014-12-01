define(
  [
    'app', 
    'views/shared/sidebar/left/left_navbar_menu-view'
  ], 
  function (App, NavbarMenuView) {

    return Backbone.Marionette.Controller.extend({
      // Create right header menu
      createNavbarMenu: function () {
      
        var navbarMenu = new NavbarMenuView();

        App.leftSidebarLayout.navbarMenuRegion.show(navbarMenu); 
      }   
    });
  }
);
