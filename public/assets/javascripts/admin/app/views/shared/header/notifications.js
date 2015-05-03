define(
  [
    'app',
    'views/shared/header/notification-item',
    'hbs!templates/shared/header/notifications'
  ], function (App, NotificationItem, notificationsTemplate) {
    
    return Backbone.Marionette.CompositeView.extend({
      template: notificationsTemplate,
      childView: NotificationItem,
      childViewContainer: ".list-wrapper",

      ui: {
        badge: '.badge'
      },
      
      initialize: function () {

      },

      onShow: function() {

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
        parent.append(this.$el.children());
        this.$el.remove();
        this.setElement(parent);
      }
    });
  }
);
