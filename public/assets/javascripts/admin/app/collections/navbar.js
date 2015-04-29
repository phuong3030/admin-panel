define(['models/func'], function (Func) {
  
  var Navbar = Backbone.Collection.extend({
    model: Func,
    url: 'api/v1/user/ui?type=sidebars'
  });

  return Navbar;
});
