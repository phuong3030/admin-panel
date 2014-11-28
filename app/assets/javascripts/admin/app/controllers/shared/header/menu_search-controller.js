define(['app', 'views/header/menu_search-view'], function (App, MenuSearchView) {
  
  return Backbone.Marionette.Controller.extend({
    initialize: function () {
      
      this.createMenuSearch();
    },

    // Create search box in header
    createMenuSearch: function () {
    
      var menuSearch = new MenuSearchView();

      App.headerLayout.menuSearchRegion.show(menuSearch);
    }
  });
});
