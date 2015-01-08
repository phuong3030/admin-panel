define(
  [
    'app', 
    'controllers/shared/main_content/head_section-controller',
    'models/shared/breadcrumb'
  ],
  function (App, HeadSectionController, Breadcrumb) {

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

        // Manually create model to test
        headSectionController.model = new Breadcrumb();
        App.routeMap = {
          '!room-type-list': 'room type',
          '!rooms-list': 'room'
        };
        headSectionController._genBreadcrumb('!room-type-list/rooms-list');

        expect(headSectionController.model.get('breads').length).toEqual(2);
        expect(headSectionController.model.get('breads')).toEqual([
          { path: '!room-type-list', pathName: 'room type' },
          { path: '!rooms-list', pathName: 'room' }
        ]);
      });
    });
  }
);
