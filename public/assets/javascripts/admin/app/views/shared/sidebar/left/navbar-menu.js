define(
  [
    'app',
    'hbs!templates/shared/sidebar/left/navbar-menu'
  ], function (App, NavbarMenuTemplate) {

    return Backbone.Marionette.LayoutView.extend({
      template: NavbarMenuTemplate
    });
  }
);
