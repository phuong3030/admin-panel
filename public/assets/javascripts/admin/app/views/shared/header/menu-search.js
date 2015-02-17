define(
  [
    'app',
    'hbs!templates/shared/header/menu-search'
  ], function (App, menuSearchTemplate) {

    return Backbone.Marionette.ItemView.extend({
      template: menuSearchTemplate,
      className: 'menu-search'
    });
  }
);
