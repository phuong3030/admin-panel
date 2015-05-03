define(
  [
    'app',
    'hbs!templates/shared/header/right-top-menu',
    'jasminejquery'
  ], function (App, RightTopMenu) {

    describe('Right top menu template', function () {

      var rightTopMenu = $(RightTopMenu());

      it('should be contained users menu', function () {
         
        expect(rightTopMenu).toContainElement('#users-menu');
      });

      it('should be contained messages menu', function () {

        expect(rightTopMenu).toContainElement('#messages-menu');
      });

      it('should be contained notifications menu', function () {

        expect(rightTopMenu).toContainElement('#notifications-menu');
      });
    });
  }
);
