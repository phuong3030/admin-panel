define(
  [
    'app',
    'hbs!templates/shared/header/top-menu-profile'
  ], function (App, topMenuProfileTemplate) {
    
    return Backbone.Marionette.LayoutView.extend({
      template: topMenuProfileTemplate,
      className: 'admin_mega-menu pull-right'
    });
  }
);
