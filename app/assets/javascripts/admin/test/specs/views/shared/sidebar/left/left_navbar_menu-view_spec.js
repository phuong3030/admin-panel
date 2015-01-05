define(
  [ 'app', 'views/shared/sidebar/left/left_navbar_menu-view', 'jasminejquery' ],
  function (App, NavbarMenuView) {
    
    describe('Left navbar menu view', function () {
      
      var navbarMenu;

      beforeEach(function () {

        navbarMenu = new NavbarMenuView();
        navbarMenu.render();
      });

      it('should have toggle menu button', function () {
      
        expect(navbarMenu.$el).toContainElement('.toggle-menu');
      });

      it('should have expand all button', function () {
      
        expect(navbarMenu.$el).toContainElement('.expand-all');
      });

      it('should show child menu when click to toggle link', function () {

        navbarMenu.ui.menu.first().click();

        expect(navbarMenu.ui.childMenu.first()).toHaveCss({ display: 'block' });
      });

      it('should store previous child menu when click to toggle link', function () {

        navbarMenu.ui.menu.first().click();

        expect(navbarMenu._previousChildMenu).toEqual(navbarMenu.ui.childMenu.first());
      });

      it('should call toggleAll method and clear previous child menu when expand all menu', function () {

        spyOn(navbarMenu, '_toggleAll');
        navbarMenu.expandAllMenu();

        expect(navbarMenu._toggleAll).toHaveBeenCalled();
        expect(navbarMenu._previousChildMenu).toEqual({});
      });

      it('should call expandAllMenu when close all menu', function () {

        spyOn(navbarMenu, 'expandAllMenu');
        navbarMenu._isExpandedAll = true;
        navbarMenu.closeAllMenu();

        expect(navbarMenu.expandAllMenu).toHaveBeenCalled();
      });

      it('should close opened child menu when call close all menu', function () {

        spyOn(navbarMenu, 'expandAllMenu');
        navbarMenu.ui.menu.first().click();
        navbarMenu.closeAllMenu();

        expect(navbarMenu._previousChildMenu).toEqual({});
      });

      it('should have button expand-all.expanded when open all child menu', function () {

        navbarMenu._toggleAll();

        expect(navbarMenu.$el).toContainElement('.expand-all.expanded');
        expect(navbarMenu._isExpandedAll).toBeTruthy();
      });
    });
  }
);

