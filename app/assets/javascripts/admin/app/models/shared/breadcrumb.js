define(['backbone'], function (Backbone) {
  
  return Backbone.Model.extend({
  
    defaults: {
      breads: [],
      last: {}
    }
  });
});
