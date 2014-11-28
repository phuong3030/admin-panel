define(['app', 'views/header/mega_menu-view'], function (App, MegaMenuView) {

  return Backbone.Marionette.Controller.extend({
    createMegaMenu: function () {
    
      var megaMenu = new MegaMenuView();
      
    }   
  });
});
