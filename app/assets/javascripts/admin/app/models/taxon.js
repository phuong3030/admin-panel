define(
  ["jquery", "backbone"],
  function($, Backbone) {


    var Taxon = Backbone.Model.extend({

      urlRoot: "/api/taxons", 

      initialize: function() {

      },

      defaults: {

      },

      validate: function(attrs) {

      }
    });

    return Taxon;
  }
);
