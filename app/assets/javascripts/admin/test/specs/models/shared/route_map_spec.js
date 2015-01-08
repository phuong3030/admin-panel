define(['models/shared/route_map'], function (Route) {

  describe('Route map model', function () {

    var route;

    beforeEach(function () {
    
      route = new Route();
    });
  
    it('should have current attribute', function () {
      
      expect(route.get('current')).toEqual('');
    });
  });
});
