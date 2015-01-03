define(
  ['app', 'views/shared/main_content/head_section-view'],
  function (App, HeadSectionView) {

    describe('Head section view', function () {

      var headSection;

      beforeEach(function () {
      
        headSection = new HeadSectionView();
        headSection.render();
      });
    
      it('should be display breadcrum', function () {

        expect(headSection.$el.find('.breadcrumb')).toBeTruthy();
      });
      it('should be display collapse function buttons', function () {
      
        expect(headSection.$el.find('.remove-sidebar')).toBeTruthy();
        expect(headSection.$el.find('.remove-header')).toBeTruthy();
        expect(headSection.$el.find('.remove-all')).toBeTruthy();
      });
    });
  }
);
