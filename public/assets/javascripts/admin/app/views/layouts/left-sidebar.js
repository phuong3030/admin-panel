define(
  [
    'app',
    'backbone',
    'marionette',
    'jquery',
    'views/shared/sidebar/left/tabs-menu',
    'views/shared/sidebar/left/navbar-menu',
    'views/shared/sidebar/left/bottom-widget',
    'hbs!templates/layouts/left-sidebar'
  ],
  function (App, Backbone, Marionette, $, TabsMenu, NavbarMenu, BottomWidget, leftSidebarTemplate) {

    return Backbone.Marionette.LayoutView.extend({
      template: leftSidebarTemplate,
      className: 'left-sidebar',

      regions: {
        tabsMenu: '.navbar-tabs-menu',
        navbarMenu: '.navbar-menu-wrapper',
        bottomWidget: '.navbar-bottom-widget'
      },
      
      onBeforeShow: function () {

        this.tabsMenu = new TabsMenu();
        this.navbarMenu = new NavbarMenu();
        this.bottomWidget = new BottomWidget();

        this.getRegion('tabsMenu').show(this.tabsMenu);
        this.getRegion('navbarMenu').show(this.navbarMenu);
        this.getRegion('bottomWidget').show(this.bottomWidget);

        this.bindEvents();
      },

      _closeAllToggleMenu: function () {

        this.navbarMenu.closeAllMenu();
      },

      bindEvents: function () {

        var that = this;
        
        App.vent.on('leftSidebar', function (type) {

          that.tabsMenu.resizeMenu(type); 
          that._closeAllToggleMenu();
        });

        App.vent.on('collapseUI', function (type) {
        
          if (type !== 'none' && type !== 'header') {

            that.tabsMenu.removeTabsMenu();
          }

          that._closeAllToggleMenu();
        });
      },

      unbindEvents: function () {

        App.vent.off('collapseUI');
        App.vent.off('leftSidebar');
      }
    });
  }
);
