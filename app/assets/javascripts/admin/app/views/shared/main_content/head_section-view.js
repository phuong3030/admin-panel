define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'hbs!templates/shared/main_content/head_section'
  ],
  function (App, Backbone, Marionette, $, titleTemplate) {

    return Backbone.Marionette.ItemView.extend({
      template: titleTemplate,
      className: 'panel-header',

      _currentCollapsedItem: 'none', // Store currentCollapse ui state

      ui: {
        collapseHeaderButton: '.remove-header-button',
        collapseSidebarButton: '.remove-sidebar-button',
        collapseAllButton: '.fullscreen-button'
      },

      onShow: function () {

        // Bind tooltip event
        this.$('[data-toggle="tooltip"]').tooltip();
      },

      events: {
        'click @ui.collapseHeaderButton': 'collapseUI',
        'click @ui.collapseSidebarButton': 'collapseUI',
        'click @ui.collapseAllButton': 'collapseUI'
      },
      
      collapseUI: function (e) {
        
        var collapseMessage = e.currentTarget.dataset.target;

        // Remove actived button class
        this.$('[data-toggle="tooltip"]').removeClass('active');

        // User click to 'another' collapsed button
        if(collapseMessage !== this._currentCollapsedItem) {

          this.$(e.currentTarget).addClass('active');
          this._currentCollapsedItem = collapseMessage;
          App.vent.trigger('collapseUI', collapseMessage);
        } else { // User re-click to old collapsed button

          this._currentCollapsedItem = 'none';
          App.vent.trigger('collapseUI', 'none');
        }
      }
    });
  }
);

