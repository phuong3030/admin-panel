define(
  [
    'app',
    'modules/shared/left-sidebar',
    'sinon',
    'jasminesinon'
  ], function (App, LeftSidebar) {

    describe('Left sidebar module', function () {

      it('should show the header layout in header region when initialized', function () {
        
        var spy = sinon.stub(App.leftSidebar, 'show');
        App.module('LeftSidebar').start();

        expect(spy).toHaveBeenCalled();

        App.leftSidebar.show.restore();
      });
    });
  }
);
