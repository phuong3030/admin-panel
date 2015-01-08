define(
  ['app', 'controllers/shared/main_content/title_section-controller'],
  function (App, TitleSectionController) {

    describe('Title section controller', function () {

      var titleSectionController;

      beforeEach(function () {

        titleSectionController = new TitleSectionController();
      });

      afterEach(function () {

        titleSectionController.unbindEvents();
      });

      it('should handle changeHeading message', function () {

        spyOn(App.vent, 'on');
        titleSectionController.bindEvents();
        App.vent.trigger('changeHeading', '!rooms-list');

        expect(App.vent.on).toHaveBeenCalled();
      });
    });
  }
);
