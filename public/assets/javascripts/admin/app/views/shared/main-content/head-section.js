define(
  [
    'app',
    'hbs!templates/shared/main-content/head-section'
  ], function (App, headSectionTemplate) {
    
    return Backbone.Marionette.ItemView.extend({
      template: headSectionTemplate,
      className: 'panel-header',
      _collapseState: 'none',

      ui: {
        menu: '.menu'
      },

      events: {
        'click @ui.menu': 'collapseUI'
      },

      collapseUI: function (e) {

        var currentTarget = $(e.currentTarget),
            collapse = currentTarget.data('target');

        this.ui.menu.removeClass('active');

        if (this._collapseState === collapse) {
        
          App.vent.trigger('collapseUI', 'none');
          this._collapseState = 'none';
        } else {

          App.vent.trigger('collapseUI', collapse);
          this._collapseState = collapse;
          currentTarget.addClass('active');
        } 
      }

    });
  }
);
