define(['app', 'views/header/mega_menu-view'], function (App, MegaMenuView) {

  return Backbone.Marionette.Controller.extend({
    initialize: function () {

      this.createMegaMenu(); 
    },

    // Create right header menu
    createMegaMenu: function () {
    
      var megaMenu = new MegaMenuView();
      
      App.headerLayout.megaMenuRegion.show(megaMenu); 
    }   
  });
});
