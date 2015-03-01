define(
  [
    'app',
    'backbone',
    'marionette',
    'jquery',
    'views/shared/sidebar/left/tabs-menu',
    'views/shared/sidebar/left/navbar-menu',
    'views/shared/sidebar/left/bottom-widget',
    'collections/navbar',
    'hbs!templates/layouts/left-sidebar'
  ],
  function (App, Backbone, Marionette, $, TabsMenu, NavbarMenu, BottomWidget, Navbar, leftSidebarTemplate) {

    return Backbone.Marionette.LayoutView.extend({
      template: leftSidebarTemplate,
      className: 'left-sidebar',

      regions: {
        tabsMenu: '.navbar-tabs-menu',
        navbarMenu: '.navbar-menu-wrapper',
        bottomWidget: '.navbar-bottom-widget'
      },
      
      onBeforeShow: function () {

        /*
         * Fetch navbar menu data from server and bind to navbar menu.
         * Navbar menu data will be different with each user
         */ 
        var navbarItems = new Navbar();
        
        navbarItems.fetch();

        // Initialize all sub views
        this.tabsMenu = new TabsMenu();
        this.navbarMenu = new NavbarMenu({ collection: navbarItems });
        this.bottomWidget = new BottomWidget();

        this.getRegion('tabsMenu').show(this.tabsMenu);
        this.getRegion('navbarMenu').show(this.navbarMenu);
        this.getRegion('bottomWidget').show(this.bottomWidget);

        // Bind collapse events
        this.bindEvents();
      },

      bindEvents: function () {

        var that = this;
        
        App.vent.on('leftSidebar', function (type) {

          that.tabsMenu.resizeMenu(type); 
          that.navbarMenu.closeAllMenu();
        });

        App.vent.on('collapseUI', function (type) {
        
          if (type !== 'none' && type !== 'header') {

            that.tabsMenu.removeTabsMenu();
          }

          that.navbarMenu.closeAllMenu();
        });
      },

      unbindEvents: function () {

        App.vent.off('collapseUI');
        App.vent.off('leftSidebar');
      }
    });
  }
);
