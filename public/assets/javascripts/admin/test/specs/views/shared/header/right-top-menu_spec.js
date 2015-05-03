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

            var spy = sinon.spy(rightTopMenu, 'onBeforeShow'),
                fakeRegion = new Backbone.Marionette.Region({
                    el: 'body',
                });

            // Use header region to fake show view method
            fakeRegion.show(rightTopMenu);
            
            expect(spy).toHaveBeenCalled();
          });
        });

        describe('When model changed', function () {
        });

        describe('Events', function () {

          it('should call catch before show event to init sub view', function () {

            var spy = sinon.spy(rightTopMenu.getRegion('topMenuProfile'), 'show');

            rightTopMenu.onBeforeShow();

            expect(spy).toHaveBeenCalled();
          });
        });
    });
  }
);
