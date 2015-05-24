define(
  [
    'app',
    'modules/shared/header',
    'sinon',
    'jasminesinon'
  ], function (App, Header) {

    describe('Header module', function () {

      it('should show the header layout in header region when initialized', function () {
        
        var spy = sinon.stub(App.header, 'show');
        App.module('Header').start();

        expect(spy).toHaveBeenCalled();

        App.header.show.restore();
      });
    });
  }
);
