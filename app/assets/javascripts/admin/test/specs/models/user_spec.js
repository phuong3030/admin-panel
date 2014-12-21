define(
  ["jquery", "backbone", "marionette", "models/user"],
  function ($, Backbone, Marionette, User) {

    describe('Demo CT with user model', function () {
      it('User model', function () {
        var newUser = new User();

        expect(true).toBeTruthy();
      });

    });
  }
);
