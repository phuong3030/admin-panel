define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'controllers/shared/sidebar/left/left_sidebar-controller'
  ], 
  function (App, Backbone, Marionette, $, LeftSidebarController) {

    describe('Left Sidebar Controller', function () {
      
      var leftSidebarController;

      beforeEach(function () {
      
        leftSidebarController = new LeftSidebarController();

        spyOn(leftSidebarController, 'createLeftSidebarLayout').and.callFake(function () {

          App.vent.on('leftSidebar', function (type) {

            console.log(type);
          });
        });
        spyOn(App.vent, 'on');

        leftSidebarController.createLeftSidebarLayout();
      });
    });
  }
);

