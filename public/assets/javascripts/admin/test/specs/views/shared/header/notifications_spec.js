define(
    [
    'app',
    'views/shared/header/notifications',
    'sinon',
    'jasminesinon'
    ], function (App, Notifications) {

      describe('Notifications View', function () {

        var notifications;

        beforeEach(function () {

          notifications = new Notifications();
          notifications.render();
        });

        describe('When view is constructing', function () {

          it('should exist', function () {

            expect(notifications).toBeDefined();
          });
        });

        describe('When view is rendered', function () {

        });

        describe('When model changed', function () {
        });

        describe('Events', function () {

        });
    });
  }
);
