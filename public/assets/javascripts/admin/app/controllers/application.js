define(['backbone', 'marionette'], function (Backbone, Marionette ) {

  return Backbone.Marionette.Controller.extend({
    initialize: function (options) {

    },

    index: function () {

      console.log('index page');
    }
  });
});
