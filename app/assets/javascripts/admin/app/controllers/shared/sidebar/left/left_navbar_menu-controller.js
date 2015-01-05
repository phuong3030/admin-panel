define(
  [
    'app', 
    'views/shared/sidebar/left/left_navbar_menu-view'
  ], 
  function (App, NavbarMenuView) {

    return Backbone.Marionette.Controller.extend({
      // Create right header menu
      createNavbarMenu: function () {
      
        this.navbarMenu = new NavbarMenuView();

        App.leftSidebarLayout.navbarMenuRegion.show(this.navbarMenu); 
      },

      _closeAllToggleMenu: function () {

        this.navbarMenu.closeAllMenu();
      },

      bindEvents: function () {
        
        var that = this;

        App.vent.on('collapseUI', function () {

          that._closeAllToggleMenu();
        });

        App.vent.on('leftSidebar', function () {

          that._closeAllToggleMenu();
        });
      },

      unbindEvents: function () {

        var that = this;

        App.vent.off('collapseUI');

        App.vent.off('leftSidebar');
      }
    });
  }
);
