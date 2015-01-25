define(['app', 'views/layouts/main-layout'], function (app, MainLayout) {

  describe('Main layout view', function () {
  
    var mainLayout;

    beforeEach(function () {
    
      mainLayout = new MainLayout();
      mainLayout.render();
    });
    
    it('should be change sidebar class when received resize sidebar message', function () {
    
      mainLayout.resizeSidebar('normal');
      expect(mainLayout.$('#left-sidebar-wrapper').hasClass('normal')).toBeTruthy();
    });

    it('should be collapsed sidebar & header when received collapseui message', function () {

      mainLayout.collapseUI('fullscreen');
      expect(mainLayout.$('header').hasClass('collapsed-header')).toBeTruthy();
      expect(mainLayout.$('#left-sidebar-wrapper').hasClass('collapsed-sidebar')).toBeTruthy();
    });

    it('should be expand main content size when received collapseui message', function () {

      mainLayout.collapseUI('fullscreen');
      expect(mainLayout.$('.admin-container').hasClass('expanded')).toBeTruthy();
    });
  });
});
