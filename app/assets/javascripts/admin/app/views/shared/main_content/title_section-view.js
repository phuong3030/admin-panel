define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'models/shared/route_map',
    'hbs!templates/shared/main_content/title_section'
  ],
  function (App, Backbone, Marionette, $, RouteModel, titleTemplate) {

    return Backbone.Marionette.ItemView.extend({
      template: titleTemplate,
      className: 'panel-header',

      modelEvents: {
        'sync': 'render',
        'change': 'render'
      }
    });
  }
);
