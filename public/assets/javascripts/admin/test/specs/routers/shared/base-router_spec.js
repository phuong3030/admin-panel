define(['app', 'routers/shared/base-router'], function (App, BaseRouter) {

  describe('Base router', function () {

    var baseRouter;

    beforeEach(function () {

      baseRouter = new BaseRouter();
    });

    it('should start sub application before hash change', function () {

      spyOn(App, 'startSubApp');
      baseRouter.before();

      expect(App.startSubApp).toHaveBeenCalledWith(baseRouter._appName);
    });

    it('should trigger the "change heading" event after hash change', function () {

      spyOn(App.vent, 'trigger');
      baseRouter.after('/', {});

      expect(App.vent.trigger).toHaveBeenCalledWith('Headingchanged', { route: '/', params: {} });
    });

  });
});
