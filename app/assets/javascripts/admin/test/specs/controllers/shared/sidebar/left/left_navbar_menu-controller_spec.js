define(
  [ 'app', 'controllers/shared/sidebar/left/left_navbar_menu-controller' ],
  function (App, NavbarMenuController) {

    describe('Left navbar menu controller', function () {

      var navbarMenuController;

      beforeEach(function () {
      
        navbarMenuController = new NavbarMenuController();

        spyOn(navbarMenuController, '_closeAllToggleMenu');
        navbarMenuController.bindEvents();
      });

      afterEach(function () {

        navbarMenuController.unbindEvents();
      });

      it('should close all toggle menu when receive resize sidebar message', function () {

        App.vent.trigger('leftSidebar', 'medium');

        expect(navbarMenuController._closeAllToggleMenu).toHaveBeenCalled();
      });

      it('should close all toggle menu when receive collapse header message', function () {

        App.vent.trigger('collapseUI', 'header');

        expect(navbarMenuController._closeAllToggleMenu).toHaveBeenCalled();
      });
    });
  }
);
