define(
    [
    'app',
    'views/shared/header/notifications',
    'sinon',
    'jasminesinon',
    'jasminejquery'
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

          it('should contain right collectionEvents', function () {

            expect(notifications.collectionEvents).toEqual(jasmine.objectContaining({
              'reset': 'insertNotificationCount'
            }));
          });

          it('should defind child view container', function () {

            expect(notifications.childViewContainer).toEqual('.list-wrapper');
          });

          it('should have badge in ui elements', function () {

            expect(notifications.ui).toEqual(jasmine.objectContaining({
              badge: notifications.$el.find('.badge')
            }));
          });
        });

        describe('When view is rendered', function () {
          
        });

        describe('When model changed', function () {
        });

        describe('View Events', function () {
          
          it('should remove the default div wrapper in onShow event', function () {

            notifications.onShow();

            expect(notifications.$el).toEqual('li.mega-li');
          });

          it('should insert collection size to badge ui element', function () {

            var stub = sinon.stub(notifications.collection, 'size').returns(2);

            notifications.insertNotificationCount();

            expect(notifications.ui.badge.html()).toEqual('2');
          });
        });
    });
  }
);
