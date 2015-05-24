define(
    [
    'app',
    'views/shared/main-content/head-section',
    'sinon',
    'jasminesinon',
    'jasminejquery'
    ], function (App, HeadSection) {

      describe('Head section in main content region', function () {

        var headSection;

        beforeEach(function () {

          headSection = new HeadSection();
          headSection.render();
        });

        describe('When view is constructing', function () {

          it('should exist', function () {

            expect(headSection).toBeDefined();
          });
        });

        describe('When view is rendered', function () {

        });

        describe('When model changed', function () {
        });

        describe('View Events', function () {

          it('should trigger event on app.vent to collapse UI', function  () {
            
            var spy = sinon.spy(App.vent, 'trigger');            

            headSection.$el.find('.remove-sidebar-button').click();

            expect(spy).toHaveBeenCalledWith('collapseUI', 'sidebar');
          });
        });
    });
  }
);
