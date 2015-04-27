define(['app', 'routers/shared/base-router', 'modules/room'], 
  function (App, BaseRouter, RoomApp) {

    App.module('RoomRouter', function (RoomRouter, App, Backbone, Marionette, $, _) {

      this.Router = BaseRouter.extend({
        appRoutes: {
          'rooms-list': 'showRoomList',
          'room-type-list': 'showRoomTypeList',
          'amenities-list': 'showAmenitiesList'
        },
        _appName: 'Room'
      });
    });

    App.addInitializer(function () {

      new (App.module('RoomRouter').Router)({
        controller: RoomApp
      });
    });
  }
);
