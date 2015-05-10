define(
  [
    'app',
    'collections/notifications',
    'views/shared/header/notification-item',
    'hbs!templates/shared/header/notifications'
  ], function (App, Notifications, NotificationItem, notificationsTemplate) {
    
    return Backbone.Marionette.CompositeView.extend({
      template: notificationsTemplate,
      childView: NotificationItem,
      childViewContainer: ".list-wrapper",

      initialize: function () {

        // Create and fetch notifications
        this.collection = new Notifications();

        this.collection.fetch();
      },

      ui: {
        badge: '.badge'
      },

      collectionEvents: {
        'sync': 'insertNotificationCount'
      },

      insertNotificationCount: function () {

        var length = this.collection.size();

        if (length > 0) {

          this.ui.badge.html(length);
        }
      },

      onShow: function () {

        /*
         * NOTE: We will remove this trick when Marionette upto version 3
         * Marionette will supports 'replaceElement' method to replace view to
         * the region element
         */

        /* 
         * Copy all view children to outside div wrapper and set the view
         * element to this parent
         */
        parent = this.$el.parent();
        wrapper = this.$el;
        this.$el = parent;
        this.el = parent[0];
        parent.append(wrapper.children());
        wrapper.remove();
        this.setElement(parent);
      }
    });
  }
);
