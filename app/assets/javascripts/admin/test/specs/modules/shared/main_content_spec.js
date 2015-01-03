define(['app', 'modules/shared/main_content'], function (App, MainContentModule) {

  describe('Main content module', function () {

    beforeEach(function () {
    
      // Fake MainContent module start
      spyOn(App.module('MainContent').headSectionController, 'createHeadSection');
      App.module('MainContent').start();
    });

    it('should create head section when it start', function () {

      expect(App.module('MainContent').headSectionController.createHeadSection).toHaveBeenCalled();
    });
  });
});
