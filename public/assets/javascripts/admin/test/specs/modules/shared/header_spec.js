define(
  [
    'app',
    'modules/shared/header'
  ], function (App, Header) {

    describe('Header module', function () {

      it('should show the header layout in header region when initialized', function () {
        
        spyOn(App.header, 'show');
        App.module('Header').start();

        expect(App.header.show).toHaveBeenCalled();
      });
    });
  }
);
