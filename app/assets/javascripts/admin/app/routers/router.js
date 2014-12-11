/*
 * Main routers module
 * 
 * Define main routes for app
 */
define(['backbone', 'marionette'], function (Backbone, Marionette) {

  return Backbone.Marionette.AppRouter.extend({
    appRoutes: {
      '': 'index'
    }
  });
});
