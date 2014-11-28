/*
 * Taxonomy Router
 *
 * Define a taxonomy router
 * Init taxonomy router to main app
 */
define(['app', 'modules/taxonomy'], function (App, TaxonomyApp) {

  App.module(
    'TaxonomyRouter', 
    function (TaxonomyRouter, App, Backbone, Marionette, $, _) {

      TaxonomyRouter.Router = Backbone.Marionette.AppRouter.extend({
        appRoutes: {
          'taxonomies': 'listTaxonomies'
        },
        before: function () {

          // Start subapp if it hasn't started
          App.startSubApp('Taxonomy');
        }
      });
    }
  );

  App.addInitializer(function () {

    new (App.module('TaxonomyRouter').Router)({
      controller: TaxonomyApp
    });
  });
});
