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
      }
    });
  }
);
