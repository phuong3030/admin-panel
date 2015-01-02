define(
  [
    'app', 
    'controllers/shared/sidebar/left/left_navbar_tabs_menu-controller'
  ],
  function (App, TabsMenuController) {

    describe('Tabs menu controller', function () {

      var tabsMenuController;

      beforeEach(function () {

        tabsMenuController = new TabsMenuController();
      }); 

      it('should be handle resize sidebar message', function () {

        spyOn(App.vent, 'on');
        tabsMenuController.navbarTabsMenu = { resizeMenu: function () {} };

        tabsMenuController.bindViewEvent();
        App.vent.trigger('leftSidebar', 'small');

        expect(App.vent.on).toHaveBeenCalled();
      });
    });
  }
);
