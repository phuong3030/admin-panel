define(['app', 'views/header/menu_search-view'], function (App, MenuSearchView) {
  
  return Backbone.Marionette.Controller.extend({
    // Create search box in header
    createMenuSearch: function () {
    
      var menuSearch = new MenuSearchView();

      App.headerLayout.menuSearchRegion.show(menuSearch);
    }
  });
});
