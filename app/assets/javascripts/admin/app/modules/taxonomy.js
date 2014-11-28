define(['app'], function (App) {

  App.module('Taxonomy', function (TaxonomyApp) {

    TaxonomyApp.startWithParent = false;

    // GET #taxonomies: show all taxonomies
    TaxonomyApp.listTaxonomies = function () {

      console.log('Show taxonomies tree');
    }

    TaxonomyApp.addFinalizer(function() {
      // Close controller 
    });
  });

  return App.module('Taxonomy');
});
