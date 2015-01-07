define(['models/shared/route'], function (Route) {

  describe('Route model', function () {

    var route;

    beforeEach(function () {
    
      route = new Route();
    });
  
    it('should have current attribute', function () {
      
      expect(route.get('current')).toEqual('');
    });
  });
});
