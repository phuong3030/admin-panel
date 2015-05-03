define(
  [
    'app',
    'views/shared/header/top-menu-profile',
    'hbs!templates/shared/header/right-top-menu'
  ], function (App, TopMenuProfile, rightTopMenuTemplate) {
    
    return Backbone.Marionette.LayoutView.extend({
      template: rightTopMenuTemplate,
      className: 'admin_mega-menu pull-right',

      regions: {
        topMenuProfile: '#top-menu-profile',
        notifications: '#notifications-menu'
      },

      onBeforeShow: function () {

        this.topMenuProfile = new TopMenuProfile();
        this.getRegion('topMenuProfile').show(this.topMenuProfile);
      }
    });
  }
);
