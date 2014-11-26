/*
 * Main app starting point
 */
require(
  [
    'App', 
    'routers/router', 
    'controllers/DesktopController', 
    'jquery', 
    'backbone', 
    'marionette', 
    'jqueryui', 
    'bootstrap', 
    'backbone.validateAll',
    'backbone.routefilter'
  ],
  function (App, MainRouter, AppController) {

    App.mainRouter = new MainRouter({
      controller: new AppController()
    });

    App.start();
  }
);
