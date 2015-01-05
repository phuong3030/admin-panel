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

      ui: {
        btnExpandMenu: '.expand-menu',
        menuContainer: '.menu-container'
      },

      events: {
        'click @ui.btnExpandMenu': 'showTabsMenu'
      },

      resizeMenu: function (type) {

        if (type !== 'normal') {

          this.ui.menuContainer.addClass('resized-tabs-menu');
          this.ui.menuContainer.hide();
          this.ui.btnExpandMenu.addClass('show');
        } else {

          this.ui.menuContainer.removeClass('resized-tabs-menu');
          this.ui.menuContainer.show();
          this.ui.btnExpandMenu.removeClass('show');
        }
      },

      // Show tabs menu effect when sidebar resized
      showTabsMenu: function () {

        this.ui.menuContainer.toggle();
        this.ui.menuContainer.toggleClass('show-tabs-menu');
      }
    });
  }
);
