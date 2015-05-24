define(
    [
    'app',
    'views/shared/header/notifications',
    'sinon',
    'jasminesinon',
    'jasminejquery'
    ], function (App, Notifications) {

      describe('Notifications View', function () {

        var notifications,
            server;

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
              'sync': 'insertNotificationCount'
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

        describe('When collection changed', function () {

          beforeEach(function () {

            server = sinon.fakeServer.create();

            // Fake response message for collection fetch request 
            server.respondWith(
              'GET', 
              '/api/v1/user/notifications?quantity=5', 
              [
                200,
                {'Content-Type': 'application/json'},
                JSON.stringify([{"id":1,"body":"This is a test notification","subject":"Subject"}])
              ]
            );
          });

          afterEach(function() {

            server.restore();
          });

          // View has already fetch it's collection when it was initialing
          it('should render new notifications count when collection fetched new data', function () {

            notifications.collection.fetch();
            server.respond();
            notifications.insertNotificationCount();

            expect(notifications.$el).toContainHtml(
              '<span class="badge bg-red">' + notifications.collection.size() 
              + '</span>'
            );
          });

          it('should render right notification in view', function () {
            
            notifications.collection.fetch();

            server.respond();

            expect(notifications.collection.size()).toEqual(1);
            expect(notifications.$el).toContainText('Subject');
          });

          it('should insert collection size to badge ui element', function () {

            var stub = sinon.stub(notifications.collection, 'size').returns(2);

            notifications.insertNotificationCount();

            expect(notifications.ui.badge.html()).toEqual('2');

            stub.restore();
          });

        });

        describe('View DOM Events', function () {

          it('should remove the default div wrapper in onShow event', function () {

            var liWrapper = $('<li class="mega-li"></li>'),
            testRegion = new Backbone.Marionette.Region({ 
              el: liWrapper[0]
            });

            testRegion.show(notifications);

            expect(notifications.$el).toHaveClass('mega-li');
          });
        });
      });
    }
);
