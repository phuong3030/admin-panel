define(
  [
    'app',
    'views/shared/sidebar/left/left_navbar_tabs_menu-view',
    'jasminejquery'
  ],
  function (App, NavbarTabsMenuView) {

    describe('Navbar tabs menu view', function () {

      var tabsMenuView;

      beforeEach(function () {
      
        tabsMenuView = new NavbarTabsMenuView();
        tabsMenuView.render();
      });

      it('should be hidden mega menu when collapse sidebar', function () {

        tabsMenuView.resizeMenu('medium'); 

        expect(tabsMenuView.ui.menuContainer).toHaveClass('resized-tabs-menu');
        expect(tabsMenuView.ui.menuContainer).toHaveCss({ display: 'none' });
      });

      it('should be show expand menu when collapse sidebar', function () {

        tabsMenuView.resizeMenu('small'); 

        expect(tabsMenuView.ui.btnExpandMenu).toHaveClass('show');
      });

      it('should show menu-container when click to expand-menu button and sidebar is collapsed', function () {

        tabsMenuView.resizeMenu('medium'); 
        tabsMenuView.ui.btnExpandMenu.click();

        expect(tabsMenuView.ui.menuContainer).toHaveClass('show-tabs-menu');
        expect(tabsMenuView.ui.menuContainer).toHaveCss({ display: 'block' });
      });
    });
  }
);
