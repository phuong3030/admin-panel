define(
  [
    'app',
    'views/shared/header/right-top-menu',
    'views/shared/header/menu-search',
    'hbs!templates/layouts/header'
  ],
  function (App, RightTopMenu, MenuSearch, headerTemplate) {

    return Backbone.Marionette.LayoutView.extend({
      template: headerTemplate,
      className: 'top-menu-wrapper',

      regions: {
        menuSearch: '.header-container .col-sm-5.col-xs-12',
        megaMenu: '.mega-menu-wrapper'
      },
      
      onBeforeShow: function () {

        this.rightTopMenu = new RightTopMenu();
        this.menuSearch = new MenuSearch();

        this.getRegion('megaMenu').show(this.rightTopMenu);
        this.getRegion('menuSearch').show(this.menuSearch);
      }
    });
  }
);
