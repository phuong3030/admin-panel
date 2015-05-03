define(
    [
    'app',
    'views/shared/header/right-top-menu',
    'sinon',
    'jasminesinon',
    'jasminejquery'
    ], function (App, RightTopMenu) {

      describe('Right top menu', function () {

        var rightTopMenu;

        beforeEach(function () {

          rightTopMenu = new RightTopMenu();
          rightTopMenu.render();
        });

        describe('When view is constructing', function () {

          it('should exist', function () {

            expect(rightTopMenu).toBeDefined();
          });
        });

        describe('When view is rendered', function () {

          it('should have right class', function () {

            expect(rightTopMenu.$el).toHaveClass('admin_mega-menu');
          });

          it('should have top menu profile region', function () {

            expect(rightTopMenu.regions).toEqual(jasmine.objectContaining({
              topMenuProfile: '#top-menu-profile',
              notifications: '#notifications-menu'
            }));
          });

          it('should add sub view when right top menu show', function () {

            var spy = sinon.spy(rightTopMenu, 'onBeforeShow');

            // Use header region to fake show view method
            Marionette.triggerMethodOn(rightTopMenu, 'before:show', rightTopMenu, {}, {});
            
            expect(spy).toHaveBeenCalled();
          });
        });

        describe('When model changed', function () {
        });

        describe('Events', function () {

          it('should call catch before show event to init sub view', function () {

            var profileMenu = sinon.spy(rightTopMenu.getRegion('topMenuProfile'), 'show'),
                notificationsMenu = sinon.spy(rightTopMenu.getRegion('notifications'), 'show');

            rightTopMenu.onBeforeShow();

            expect(profileMenu).toHaveBeenCalled();
            expect(notificationsMenu).toHaveBeenCalled();
          });
        });
    });
  }
);
