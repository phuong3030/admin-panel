/*
 * Main Layout
 *
 * Use for render header html struture
 */
define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery',
    'hbs!templates/layouts/application'
  ],
  function (App, Backbone, Marionette, $, applicationTemplate) {

    return Backbone.Marionette.LayoutView.extend( {
      template: applicationTemplate,
      className: 'admin_body',

      ui: {
        leftSidebar: '#left-sidebar-wrapper',
        header: 'header',
        mainContent: '.admin-container'
      },

      // Listener for handle resize button event
      events: {

      },

      // Load all sub UI module after the main layout
      onShow: function () {

        require(
          [
            'modules/shared/header',
            'modules/shared/left-sidebar',
            'modules/shared/right-sidebar',
            'modules/shared/main-content'
          ]
        );
      },

      /*
       * Left sizebar resizer
       * Resize the sizebar with 3 type: full-width, small, medium
       */
      resizeSidebar: function (type) {

        this.ui.leftSidebar.removeClass('medium small normal').addClass('sidebar ' + type);
        this.ui.mainContent.removeClass('medium small normal').addClass('admin-container ' + type);
      },

      /*
       * Collapse the sizebar and header by user
       */
      collapseUI: function (type) {

        // Code duplicated because we have animation
        if (type === 'none') {

          this.ui.leftSidebar.removeClass('collapsed-sidebar');
          this.ui.header.removeClass('collapsed-header');
          this.ui.mainContent.removeClass('expanded');
        } else if (type === 'header') {

          this.ui.leftSidebar.removeClass('collapsed-sidebar');
          this.ui.mainContent.removeClass('expanded');
          this.ui.header.addClass('collapsed-header');
        } else if (type === 'sidebar') {

          this.ui.header.removeClass('collapsed-header');
          this.ui.mainContent.addClass('expanded');
          this.ui.leftSidebar.addClass('collapsed-sidebar');
        } else if (type === 'fullscreen') {

          this.ui.header.addClass('collapsed-header');
          this.ui.mainContent.addClass('expanded');
          this.ui.leftSidebar.addClass('collapsed-sidebar');
        }
      }
    });
  }
);
