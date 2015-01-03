/*
 * Navbar tabs menu 
 *
 * Render navbar tabs menu
 */
define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'hbs!templates/shared/sidebar/left/left_navbar_tabs_menu'
  ],
  function (App, Backbone, Marionette, $, navbarTabsMenuTemplate) {

    return Backbone.Marionette.LayoutView.extend( {
      template: navbarTabsMenuTemplate,
      className: 'navbar-tabs-menu-container',

      // View Event Handlers
      events: {

      },

      resizeMenu: function (type) {

        if (type !== 'normal') {

          this.$('.menu-container').addClass('hidden');
          this.$('.expand-menu').addClass('show');
        } else {

          this.$('.menu-container').removeClass('hidden');
          this.$('.expand-menu').removeClass('show');
        }
      }
    });
  }
);
