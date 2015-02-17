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

      _currentActived: 'normal',      

      regions: {
        menuSearch: '.header-container .col-sm-5.col-xs-12',
        megaMenu: '.mega-menu-wrapper'
      },

      ui: {
        mediumButton: '.nav-medium-button',
        smallButton: '.nav-small-button' 
      },

      // View Event Handlers declaration
      events: {
        'click @ui.mediumButton': 'resizeSidebar',
        'click @ui.smallButton': 'resizeSidebar'
      },

      onBeforeShow: function () {

        this.rightTopMenu = new RightTopMenu();
        this.menuSearch = new MenuSearch();

        this.getRegion('megaMenu').show(this.rightTopMenu);
        this.getRegion('menuSearch').show(this.menuSearch);
      },
      
      onShow: function () {
        
        // Bind tooltip event
        this.$('[data-toggle="tooltip"]').tooltip();
      },

      // Event handlers
      resizeSidebar: function (e) {
        
        var clickedButton = e.currentTarget === this.ui.mediumButton[0] ? 'medium' : 'small';

        // Remove actived css class in menu button
        this.$('.menu').removeClass('actived');

        if (this._currentActived !== clickedButton) {

          this._currentActived = clickedButton;
          this.$(e.currentTarget).addClass('actived');
          App.vent.trigger('leftSidebar', clickedButton);
        } else {

          this._currentActived = 'normal';
          App.vent.trigger('leftSidebar', 'normal');
        }
      }
    });
  }
);
