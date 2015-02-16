define(
  [
    'app',
    'hbs!templates/shared/header/right-top-menu'
  ], function (App, rightTopMenuTemplate) {
    
    return Backbone.Marionette.LayoutView.extend({
      template: rightTopMenuTemplate,
      className: 'admin_mega-menu pull-right'
    });
  }
);
