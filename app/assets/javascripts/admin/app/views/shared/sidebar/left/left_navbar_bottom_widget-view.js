/*
 * Navbar bottom widget view
 *
 * Render left sidebar bottom widget
 */
define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'hbs!templates/shared/sidebar/left/left_navbar_bottom_widget'
  ],
  function (App, Backbone, Marionette, $, navbarBottomWidget) {

    return Backbone.Marionette.LayoutView.extend( {
      template: navbarBottomWidget,
      tagName: 'ul',

      events: {
        'click a': 'logout'
      },

      logout: function(e) {

        $.ajax({
          url: '/admin/logout',
          type: 'delete',
          statusCode: {
            204: function() {

              // Return to login page
              window.location.href = '/admin/login';
            }
          }
        });

        return false;
      }
    });
  }
);
