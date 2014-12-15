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
        console.log('logout clicked!');

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
