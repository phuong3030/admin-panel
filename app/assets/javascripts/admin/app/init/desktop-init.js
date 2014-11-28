/*
 * Main app starting point
 */
require(
  [
    'app', 
    'routers/router', 
    'controllers/desktop-controller', 
    'modules/shared/header',
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
