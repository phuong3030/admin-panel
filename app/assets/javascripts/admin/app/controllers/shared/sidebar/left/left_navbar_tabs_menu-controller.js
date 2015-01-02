define(
  [
    'app', 
    'views/shared/sidebar/left/left_navbar_tabs_menu-view'
  ], 
  function (App, NavbarTabsMenuView) {

    return Backbone.Marionette.Controller.extend({
      // Create right header menu
      createNavbarTabsMenu: function () {
      
        this.navbarTabsMenu = new NavbarTabsMenuView();
        
        App.leftSidebarLayout.tabsMenuRegion.show(this.navbarTabsMenu);
      },

      bindEvent: function () {

        var that = this;
        
        App.vent.on('leftSidebar', function (type) {

          that.navbarTabsMenu.resizeMenu(type); 
        });
      }
    });
  }
);
