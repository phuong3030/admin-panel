define(['backbone'], function (Backbone) {

  return Backbone.Model.extend({
    url: '/static/route_map.json',

    defaults: {
      current: ''
    }
  });
});
