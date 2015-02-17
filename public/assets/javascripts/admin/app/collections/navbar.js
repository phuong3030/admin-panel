define(['models/func'], function (Func) {
  
  var Navbar = Backbone.Collection.extend({
    model: Func,
    url: 'api/v1/functions/navbar'
  });

  return Navbar;
});
