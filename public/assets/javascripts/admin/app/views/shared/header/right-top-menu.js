define(
  [
    'app',
    'views/shared/header/top-menu-profile',
    'views/shared/header/notifications',
    'hbs!templates/shared/header/right-top-menu'
  ], function (App, TopMenuProfile, NotificationsView, rightTopMenuTemplate) {
    
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

        this.topMenuProfile = new TopMenuProfile();
        this.notificationsView = new NotificationsView();

        this.getRegion('topMenuProfile').show(this.topMenuProfile);
        this.getRegion('notifications').show(this.notificationsView, { replaceElement: true });
      },

      openChildMenu: function (e) {
        
        $(e.currentTarget).next().slideToggle();
      }
    });
  }
);
