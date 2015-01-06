define(['app', 'routers/room-router'], function (App) {

  describe('Room router', function () {

    var RoomRouter;

    beforeEach(function () {
    
      RoomRouter = App.module('RoomRouter').Router;
    });

    it('should be defined rooms-list routes', function () {
    
      expect(RoomRouter.prototype.appRoutes).toEqual(
        jasmine.objectContaining({
          '!rooms-list': 'showRoomList'
        })
      );
    });

    it('should be defined room-type-list routes', function () {
    
      expect(RoomRouter.prototype.appRoutes).toEqual(
        jasmine.objectContaining({
          '!room-type-list': 'showRoomTypeList'
        })
      );
    });

    it('should be defined amenities-list routes', function () {
    
      expect(RoomRouter.prototype.appRoutes).toEqual(
        jasmine.objectContaining({
          '!amenities-list': 'showAmenitiesList'
        })
      );
    });

    it('should be triggered change heading message in after router filter');
  });
});
