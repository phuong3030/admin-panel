define(['templates/helpers/breadcrumb'], function (Breadcrumb) {

  describe('Breadcrumb handlebars helper', function () {
    
    describe('should have right conversion paths function', function () {

      it('return right bread when get non-empty paths list', function () { 
        expect(Breadcrumb.breakPaths(['admin'])).toEqual([
          { name: 'Default Dashboard', url: '/admin' }
        ]);
      });

      it('return empty bread when get empty paths list', function () {

        expect(Breadcrumb.breakPaths([])).toEqual([]);
      });
    });
  });
});
