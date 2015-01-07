define(['backbone'], function (Backbone) {

  return Backbone.Model.extend({
    url: '/static/route.json',

    defaults: {
      current: ''
    }
  });
});
