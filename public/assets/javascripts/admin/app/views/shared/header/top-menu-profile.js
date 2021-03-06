define(
  [
    'app',
    'models/shared/user',
    'hbs!templates/shared/header/top-menu-profile'
  ], function (App, User, topMenuProfileTemplate) {
    
    return Backbone.Marionette.ItemView.extend({
      template: topMenuProfileTemplate,
      className: 'admin_mega-menu pull-right',

      ui: {
        'logoutLink': 'a.logout'
      },

      events: {
        'click @ui.logoutLink': 'logout'
      },

      logout: function(e) {
        $.ajax({
          url: '/user/logout',
          type: 'delete',
          statusCode: {
            204: function() {

              window.location.assign(window.location.origin + '/admin/logout');
            }
          }
        });

        return false;
      },

      initialize: function () {

        this.model = new User();
        this.model.fetch();
      },

      modelEvents: {
        'change': 'render'
      }
    });
  }
);
