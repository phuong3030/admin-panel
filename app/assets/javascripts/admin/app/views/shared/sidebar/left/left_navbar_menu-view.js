/*
 * Navbar tabs menu 
 *
 * Render navbar menu
 */
define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'underscore', 
    'hbs!templates/shared/sidebar/left/left_navbar_menu'
  ],
  function (App, Backbone, Marionette, $, _, navbarMenuTemplate) {

    return Backbone.Marionette.LayoutView.extend({
      template: navbarMenuTemplate,
      className: 'navbar-menu',

      _previousChildMenu: {},
      _isExpandedAll: false,

      ui: {
        menu: '.toggle-menu',
        expandAllBtn: '.expand-all',
        childMenu: '.child-menu'
      },

      events: {
        'click @ui.menu': 'toggleMenu',
        'click @ui.expandAllBtn': 'expandAllMenu'
      },

      onShow: function () {
   
        // Bind tooltip events
        $('[data-toggle="tooltip"]').tooltip();
      },

      toggleMenu: function (e) {

        var currentChildMenu = $(e.currentTarget.nextElementSibling);

        // Close another child menu
        if (!$.isEmptyObject(this._previousChildMenu) && 
            currentChildMenu[0] !== this._previousChildMenu[0]) {

          this._previousChildMenu.slideToggle(150, 'swing');
        }

        // All toggle menu is expanded, we close all
        if (this._isExpandedAll) {
          
          this._toggleAll();
        }

        // Toggle child menu effect
        currentChildMenu.slideToggle(150, 'swing');

        // Store current child menu
        if (currentChildMenu[0] !== this._previousChildMenu[0]) {

          this._previousChildMenu = currentChildMenu;
        } else {

          // release previous if user close all toggle menu
          this._previousChildMenu = {};
        }
      },

      expandAllMenu: function (e) {

        var that = this;

        // Have already had child menu open
        if (!$.isEmptyObject(this._previousChildMenu)) {

          this._previousChildMenu.slideToggle(150, 'swing', function () {

            that._toggleAll(); 
          });
        } else {

          this._toggleAll();
        }

        // Clear previous child menu flag
        this._previousChildMenu = {};
      }, 

      _toggleAll: function () {

        var lstToggleMenu = this.ui.childMenu.toArray();

        // Toggle all
        _.each(lstToggleMenu, function (el) {
              
          $(el).slideToggle(150, 'swing');
        });

        if (this._isExpandedAll) {

          this.ui.expandAllBtn.removeClass('expanded');
        } else {

          this.ui.expandAllBtn.addClass('expanded');
        }

        this._isExpandedAll = !(this._isExpandedAll);
      },

      closeAllMenu: function () {
        
        // Close all opened menus
        if (this._isExpandedAll) {

          this.expandAllMenu();
        }

        // Close one opened menu
        if (!$.isEmptyObject(this._previousChildMenu)) {

          this._previousChildMenu.slideToggle(150, 'swing');
          this._previousChildMenu = {};
        }
      }
    });
  }
);
