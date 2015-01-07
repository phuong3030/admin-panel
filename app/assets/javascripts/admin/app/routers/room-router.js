define(['app', 'modules/room'], function (App, RoomApp) {

  App.module('RoomRouter', function (RoomRouter, App, Backbone, Marionette, $, _) {
  
    this.Router = Backbone.Marionette.AppRouter.extend({
      appRoutes: {
        '!rooms-list': 'showRoomList',
        '!room-type-list': 'showRoomTypeList',
        '!amenities-list': 'showAmenitiesList'
      },

      before: function () {

        // Start room app
        App.startSubApp('Room');
      },

      after: function () {
        
        // Change heading page title by creating message in app vent
        // todo: will inheritance from super router
      },

      showRoomList: function () {
      },

      showRoomTypeList: function () {
      },

      showAmenitiesList: function () {
      }
    });
  });

  App.addInitializer(function () {

    new (App.module('RoomRouter').Router)({
      controller: RoomApp
    });
  });
});
