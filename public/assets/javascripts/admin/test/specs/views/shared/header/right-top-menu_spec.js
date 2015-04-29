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

        describe('when view is constructing', function () {

          it('should exist', function () {

            expect(rightTopMenu).toBeDefined();
          });
        });

        describe('when view is rendered', function () {

          it('should have right class', function () {

            expect(rightTopMenu.$el).toHaveClass('admin_mega-menu');
          });

          it('should call catch before show event to init sub view', function () {

          });
        });

        describe('when model changed', function () {
        });

        describe('events', function () {
        });
    });
  }
);
