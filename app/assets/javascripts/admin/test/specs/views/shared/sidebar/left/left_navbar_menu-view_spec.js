define(
  [ 'app', 'views/shared/sidebar/left/left_navbar_menu-view' ],
  function (App, NavbarMenuView) {
    
    describe('Left navbar menu view', function () {
      
      var navbarMenu;

      beforeEach(function () {

        navbarMenu = new NavbarMenuView();
        navbarMenu.render();
      });

      it('should be', function () {
      
      });
    });
  }
);

