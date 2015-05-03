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

          it('should have right class', function () {

            expect(notifications.$el).toHaveClass('one-icon mega-li');
          });

          it('should have top menu profile region', function () {

          });

          it('should add sub view when right top menu show', function () {

          });
        });

        describe('When model changed', function () {
        });

        describe('Events', function () {

        });
    });
  }
);
