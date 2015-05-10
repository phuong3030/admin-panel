define(
  [
    'app',
    'modules/shared/left-sidebar'
  ], function (App, LeftSidebar) {

    describe('Left sidebar module', function () {

      it('should show the header layout in header region when initialized', function () {
        
        spyOn(App.leftSidebar, 'show');
        App.module('LeftSidebar').start();

        expect(App.leftSidebar.show).toHaveBeenCalled();
      });
    });
  }
);
