define(
  [
    'app',
    'hbs!templates/shared/header/notification-item'
  ], function (App, notificationItemTemplate) {
    
    return Backbone.Marionette.ItemView.extend({
      template: notificationItemTemplate,
      tagName: 'li'
    });
  }
);
