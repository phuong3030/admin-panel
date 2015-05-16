define(
  [
    'app',
    'hbs!templates/shared/main-content/head-section'
  ], function (App, headSectionTemplate) {
    
    return Backbone.Marionette.ItemView.extend({
      template: headSectionTemplate,
      className: 'panel-header',

      ui: {
      }

    });
  }
);
