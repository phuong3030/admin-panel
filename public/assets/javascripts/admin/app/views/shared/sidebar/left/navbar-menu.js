define(
  [
    'app',
    'views/shared/sidebar/left/group-sidebar',
    'hbs!templates/shared/sidebar/left/navbar-menu'
  ], function (App, GroupSidebar, NavbarMenuTemplate) {

    return Backbone.Marionette.CompositeView.extend({
      template: NavbarMenuTemplate,
      _previousChildMenu: {},
      _isExpandedAll: false,
      childView: GroupSidebar,
      childViewContainer: "ul",

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

        var that = this,
            timeout;
   
        // Bind tooltip events
        $('[data-toggle="tooltip"]').tooltip();

        // Re-bind ui hash, childmenus are being appended dynamically
        timeout = setTimeout(function () {
        
          that.bindUIElements();
          clearTimeout(timeout);
        }, 500);
      },

      toggleMenu: function (e) {

        var currentLink = $(e.currentTarget),
            currentChildMenu = currentLink.next();

        // Toggle child menu effect
        currentChildMenu.slideToggle(150, 'swing').toggleClass('open');
      },

      closeAllMenu: function (e) {

        this.ui.childMenu.slideUp(150, 'swing').removeClass('open');
      },

      expandAllMenu: function (e) {

        var that = this,
            childMenu = this.$('.child-menu'),
            lstToggleMenu = this.ui.childMenu.toArray();

        if (this._isExpandedAll) {

          this.ui.expandAllBtn.removeClass('expanded');
          childMenu.slideUp(150, 'swing').removeClass('open');
        } else {

          this.ui.expandAllBtn.addClass('expanded');
          childMenu.slideDown(150, 'swing').addClass('open');
        }

        this._isExpandedAll = !(this._isExpandedAll);
      }
    });
  }
);
