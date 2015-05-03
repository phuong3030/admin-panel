define(
  [
    'app',
    'collections/notifications',
    'views/shared/header/top-menu-profile',
    'views/shared/header/notifications',
    'hbs!templates/shared/header/right-top-menu'
  ], function (App, Notifications, TopMenuProfile, NotificationsView, rightTopMenuTemplate) {
    
    return Backbone.Marionette.LayoutView.extend({
      template: rightTopMenuTemplate,
      className: 'admin_mega-menu pull-right',

      regions: {
        topMenuProfile: '#top-menu-profile',
        notifications: '#notifications-menu'
      },

      ui: {
        'link': 'a.mega-link'
      },

      events: {
        'click @ui.link': 'openChildMenu'
      },


      onBeforeShow: function () {

        // Create and fetch notifications
        var notifications = new Notifications();

        notifications.fetch();

        this.topMenuProfile = new TopMenuProfile();
        this.notificationsView = new NotificationsView({ collection: notifications });

        this.getRegion('topMenuProfile').show(this.topMenuProfile);
        this.getRegion('notifications').show(this.notificationsView, { replaceElement: true });
      },

      openChildMenu: function (e) {
        
        $(e.currentTarget).next().slideToggle();
      }
    });
  }
);
