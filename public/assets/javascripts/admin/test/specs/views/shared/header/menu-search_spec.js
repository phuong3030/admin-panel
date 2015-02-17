define(
  [
    'app',
    'views/shared/header/menu-search',
    'jasminejquery'
  ], function (App, MenuSearch) {

    describe('Menu search view', function () {

      var menuSearch;

      beforeEach(function () {
        
        menuSearch = new MenuSearch();
        menuSearch.render();
      });

      it('should be contained search box', function () {
        
        expect(menuSearch.$el).toContainElement('#search-box');
      });
    });
  }
);
