define(
  [
    'app',
    'models/user',
    'hbs!templates/shared/header/top-menu-profile'
  ], function (App, User, topMenuProfileTemplate) {
    
    return Backbone.Marionette.ItemView.extend({
      template: topMenuProfileTemplate,
      className: 'admin_mega-menu pull-right',

      ui: {
        'link': 'a.mega-link',
        'megaChildMenu': '.mega-menu-content'
      },

      events: {
        'click @ui.link': 'openChildMenu'
      },

      initialize: function () {

        this.model = new User();
        this.model.fetch();
      },

      modelEvents: {
        'change': 'render'
      },

      openChildMenu: function (e) {
        
        this.ui.megaChildMenu.slideToggle('slow');
      }
    });
  }
);
