define(
  [
    'app',
    'hbs!templates/shared/sidebar/left/bottom-widget'
  ], function (App, bottomWidgetTemplate) {

    return Backbone.Marionette.ItemView.extend({
      template: bottomWidgetTemplate,
      tagName: 'ul'
    });
  }
);
