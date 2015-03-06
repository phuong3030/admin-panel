define(
  [
    'app',
    'views/shared/header/top-menu-profile',
    'jasminejquery'
  ], function (App, TopMenuProfile) {

    describe('Top menu profile', function () {

      var topMenuProfile;

      beforeEach(function () {

        topMenuProfile = new TopMenuProfile();
        topMenuProfile.render();
      });
      
    });
  }
);
