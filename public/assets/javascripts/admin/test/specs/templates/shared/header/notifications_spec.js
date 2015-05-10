define(
  [
    'app',
    'hbs!templates/shared/header/notifications',
    'jasminejquery'
  ], function (App, Notifications) {

    describe('Notifications template', function () {

      var notifications = $('<div>' + Notifications() + '</div>');

      it('should be contained mega link', function () {
         
        expect(notifications).toContainElement('.mega-link');
      });

      it('should be contained mega menu content', function () {

        expect(notifications).toContainElement('.mega-menu-content');
      });

      it('should be contained content list', function () {

        expect(notifications).toContainElement('.content-list');
        expect(notifications).toContainElement('ul.list-wrapper');
      });
    });
  }
);
