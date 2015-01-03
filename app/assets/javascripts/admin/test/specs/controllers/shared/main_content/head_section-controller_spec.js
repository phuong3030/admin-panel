define(
  ['app', 'controllers/shared/main_content/head_section-controller'],
  function (App, HeadSectionController) {

    describe('Head section controller', function () {

      var headSectionController;

      beforeEach(function () {

        headSectionController = new HeadSectionController();
      });
    
      it('should call head section view to re-render new breadcrumb when hash changed'); 

      it('should listen collapsing header & sidebar message', function () {

        headSectionController.headSectionView = { collapseUI: function () {} };
        spyOn(App.vent, 'on');

        headSectionController.bindEvents();
        App.vent.trigger('collapseUI', 'header');

        expect(App.vent.on).toHaveBeenCalled();
      });
    });
  }
);
