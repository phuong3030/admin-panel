define(
  [
    'app',
    'hbs!templates/shared/sidebar/left/tabs-menu'
  ], function (App, tabsMenuTemplate) {

    return Backbone.Marionette.LayoutView.extend({
      template: tabsMenuTemplate
    });
  }
);
