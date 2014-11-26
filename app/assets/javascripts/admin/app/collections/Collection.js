define(["jquery","backbone","models/taxon"],
  function($, Backbone, Taxon) {
    // Creates a new Backbone Collection class object
    var Collection = Backbone.Collection.extend({
      // Tells the Backbone Collection that all of it's models will be of type Model (listed up top as a dependency)
      model: Taxon
    });

    return Collection;
  });
