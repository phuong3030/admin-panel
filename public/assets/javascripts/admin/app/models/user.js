define(["jquery", "backbone"], function($, Backbone) {

  var User = Backbone.Model.extend({

    urlRoot: "/api/v1/user", 

    initialize: function() {

    },

    defaults: {
      username: 'abc'
    },

    validate: function(attrs) {

    }  
  });

  return User;
});
