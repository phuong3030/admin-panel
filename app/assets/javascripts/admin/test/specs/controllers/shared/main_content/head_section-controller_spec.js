define(
  ['app', 'controllers/shared/main_content/head_section-controller'],
  function (App, HeadSectionController) {

    describe('Head section controller', function () {

      var headSectionController;

      beforeEach(function () {

        headSectionController = new HeadSectionController();
      });
    
      it('should call head section view to re-render new breadcrumb when hash changed'); 
    });
  }
);