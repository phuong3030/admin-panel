define(['models/shared/breadcrumb'], function (Breadcrumb) {

  describe('Breadcrumb model', function () {
    
    var breadcrumb;

    beforeEach(function () {
    
      breadcrumb = new Breadcrumb();
    });
  
    it('should be had breads in defaults', function () {

      expect(breadcrumb.get('breads')).toEqual([]);
      expect(breadcrumb.get('last')).toEqual({});
    });
  });
});
