define(
  [
    'app',
    'views/shared/sidebar/left/left_navbar_tabs_menu-view'
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

        expect(tabsMenuView.$('.menu-container').hasClass('hidden')).toBeTruthy();
      });

      it('should be show expand menu when collapse sidebar', function () {

        tabsMenuView.resizeMenu('small'); 

        expect(tabsMenuView.$('.expand-menu').hasClass('show')).toBeTruthy();
      });
    });
  }
);
