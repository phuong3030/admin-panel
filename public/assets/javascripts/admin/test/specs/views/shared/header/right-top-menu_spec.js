define(
  [
    'app',
    'views/shared/header/right-top-menu',
    'jasminejquery'
  ], function (App, RightTopMenu) {

    describe('Right top menu', function () {

      var rightTopMenu;

      beforeEach(function () {

        rightTopMenu = new RightTopMenu();
        rightTopMenu.render();
      });
      
      it('should be contained mega list', function () {

        expect(rightTopMenu.$el).toContainElement('.mega-ul');
      });
    });
  }
);
