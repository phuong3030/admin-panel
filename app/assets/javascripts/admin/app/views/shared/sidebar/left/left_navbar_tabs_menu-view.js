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

          this.ui.menuContainer.addClass('resized-tabs-menu')
            .removeClass('show-tabs-menu');
          this.ui.menuContainer.hide();
          this.ui.btnExpandMenu.addClass('show');
        } else {

          this.removeTabsMenu();
          this.ui.menuContainer.show();
          this.ui.btnExpandMenu.removeClass('show');
        }
      },

      removeTabsMenu: function () {

        this.ui.menuContainer.removeClass('show-tabs-menu').hide();
      },

      // Show tabs menu effect when sidebar resized
      showTabsMenu: function () {

        var that = this;

        // Css3 effect first and hide later
        if (this.ui.menuContainer.is(":visible")) {

          // toggleClass method doesn't have oncompleted callback
          this.ui.menuContainer.toggleClass('show-tabs-menu').delay(250).toggle(0);
        } else { // show first and css3 effect later

          this.ui.menuContainer.toggle(0, function () {

            that.ui.menuContainer.toggleClass('show-tabs-menu');
          });
        }
      }
    });
  }
);
