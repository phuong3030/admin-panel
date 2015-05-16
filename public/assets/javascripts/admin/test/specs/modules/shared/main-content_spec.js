define(
  [
    'app',
    'modules/shared/main-content',
    'sinon',
    'jasminesinon'
  ], function (App, MainContent) {

    describe('Main content module', function () {

      it('should show the head section in head section region when initialized', function () {
        
        var spy = sinon.stub(App.headSection, 'show');
        App.module('MainContent').start();

        expect(spy).toHaveBeenCalled();

        App.headSection.show.restore();
      });
    });
  }
);
