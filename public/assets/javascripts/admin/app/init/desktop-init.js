/*
 * Main app starting point
 */
require(
  [
    'app', 
    'routers/router', 
    'controllers/application',
    'modules/shared/header',
    'modules/shared/left-sidebar',
    'modules/shared/right-sidebar',
    'modules/shared/main-content',
    'jquery', 
    'backbone', 
    'marionette', 
    'bootstrap', 
    'backbone.validateAll',
    'backbone.routefilter'
  ],
  function (App, MainRouter, AppController) {

    App.mainRouter = new MainRouter({
      controller: new AppController()
    });

    // Init application layout view before start app
    require([], function (ApplicationLayout) {

      App.applicationLayout = new ApplicationLayout();
      App.applicationRegion.show(App.applicationLayout);
      App.start();
    });
  }
);
