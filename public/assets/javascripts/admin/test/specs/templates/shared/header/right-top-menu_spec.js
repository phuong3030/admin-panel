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
        // Number of users requests
        expect(rightTopMenu).toContainElement('#users-menu .badge');
      });

      it('should be contained messages menu', function () {

        expect(rightTopMenu).toContainElement('#messages-menu');
        // Number of messages 
        expect(rightTopMenu).toContainElement('#messages-menu .badge');
      });

      it('should be contained notifications menu', function () {

        expect(rightTopMenu).toContainElement('#notifications-menu');
        // Number of notifications 
        expect(rightTopMenu).toContainElement('#notifications-menu .badge');
      });
    });
  }
);
