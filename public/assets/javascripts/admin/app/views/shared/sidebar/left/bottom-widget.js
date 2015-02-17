define(
  [
    'app',
    'hbs!templates/shared/sidebar/left/bottom-widget'
  ], function (App, bottomWidgetTemplate) {

    return Backbone.Marionette.ItemView.extend({
      template: bottomWidgetTemplate,
      tagName: 'ul',

      events: {
        'click a': 'logout'
      },

      logout: function(e) {
        $.ajax({
          url: '/user/logout',
          type: 'delete',
          statusCode: {
            204: function() {

              console.log(window.location.origin + '/admin/logout');
              // Return to login page
              window.location.assign(window.location.origin + '/admin/logout');
              console.log(window.location);
            }
          }
        });

        return false;
      }
    });
  }
);
