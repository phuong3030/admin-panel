define(
  ['app', 'controllers/shared/main_content/head_section-controller'],
  function (App, HeadSectionController) {

    describe('Head section controller', function () {

      var headSectionController;

      beforeEach(function () {

        headSectionController = new HeadSectionController();
      });

      afterEach(function () {

        headSectionController.unbindEvents();
      });
    
      it('should call head section view to re-render new breadcrumb when hash changed', function () {

        spyOn(HeadSectionController.prototype, '_genBreadcrumb');
        headSectionController.bindEvents();
        App.vent.trigger('changeHeading', '!rooms-list');

        expect(headSectionController._genBreadcrumb).toHaveBeenCalledWith('!rooms-list');
      }); 

      it('should be split route change breadcrumb model', function () {

        headSectionController._genBreadcrumb('!room-type-list/rooms-list');

        expect(headSectionController.model.get('breads').length()).toEqual(2);
      });
    });
  }
);
