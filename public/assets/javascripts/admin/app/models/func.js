define(['backbone'], function(Backbone) {

  var Func = Backbone.Model.extend({
    url: '/function'
  });

  return Func;
});
