define(['templates/helpers/breadcrumb', 'handlebars', 'sinon'], function (Breadcrumb) {

  describe('Breadcrumb handlebars helper', function () {
    
    describe('have right conversion paths function', function () {

      it('return right bread when get non-empty paths list', function () { 

        expect(Breadcrumb.breakPaths(['admin'])).toEqual([
          { name: 'Default Dashboard', url: '/admin' }
        ]);
      });

      it('return empty bread when get empty paths list', function () {

        expect(Breadcrumb.breakPaths([])).toEqual([]);
      });
    });

    describe('breadcrumb generator', function () {

      // Prevent stub on window.location.pathname
      it('should render right breadcrumb list elements', function () {

        expect(Breadcrumb.breadcrumb()).toEqual(new Handlebars.SafeString(''));
      });
    });
  });
});
