define(
  [
    'app',
    'views/shared/sidebar/left/group-sidebar',
    'sinon',
    'jasminesinon',
    'jasminejquery'
  ], function (App, GroupSidebar) {
    
    describe('Group Sidebar view', function () {

      var groupSidebar;

      beforeEach(function () {

        groupSidebar = new GroupSidebar();
        groupSidebar.render();
      });

      describe('When view is contructing', function () {

        it('should exist', function () {
          
          expect(groupSidebar).toBeDefined();
        });
      });

      describe('When view is rendered', function () {
      });

      describe('When model changed', function () {
      
      });

      describe('Events', function () {
      
      });
    });
  }
);
