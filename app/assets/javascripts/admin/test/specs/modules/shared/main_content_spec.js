define(['app', 'modules/shared/main_content'], function (App, MainContentModule) {

  describe('Main content module', function () {

    afterEach(function () {
    
      App.module('MainContent').stop();
    });

    it('should create head section and title section when it start', function () {

      spyOn(App.module('MainContent').headSectionController, 'createHeadSection');
      spyOn(App.module('MainContent').titleSectionController, 'createTitleSection');
      App.module('MainContent').start();

      expect(App.module('MainContent').headSectionController.createHeadSection).toHaveBeenCalled();
      expect(App.module('MainContent').titleSectionController.createTitleSection).toHaveBeenCalled();
    });
  });
});
