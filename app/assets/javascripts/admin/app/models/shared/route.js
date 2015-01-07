define(['backbone'], function (Backbone) {

  return Backbone.Model.extend({
    url: '',

    defaults: {
      current: ''
    }
  });
});
