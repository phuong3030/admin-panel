define(['models/shared/notification'], function (Notification) {
  
  var Notifications = Backbone.Collection.extend({
    model: Notification,
    url: '/api/v1/user/notifications?quantity=5'
  });

  return Notifications;
});
