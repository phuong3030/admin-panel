define(['app', 'views/layouts/main-layout'], function (app, MainLayout) {

  describe('Main layout view', function () {
  
    var mainLayout;

    beforeEach(function () {
    
      mainLayout = new MainLayout();
      mainLayout.render();
    });
    
    it('should be change sidebar class when receive resize sidebar message', function () {
    
      mainLayout.resizeSidebar('normal');
      expect(mainLayout.$('#left-sidebar-wrapper').hasClass('normal')).toBeTruthy();
    });
  });
});
