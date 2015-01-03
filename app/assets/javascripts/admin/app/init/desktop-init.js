/*
 * Main app starting point
 */
require(
  [
    'app', 
    'routers/router', 
    'controllers/desktop-controller', 
    'modules/shared/header',
    'modules/shared/left_sidebar',
    'modules/shared/right_sidebar',
    'modules/shared/main_content',
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
    require(['views/layouts/main-layout'], function (ApplicationLayout) {

      App.applicationLayout = new ApplicationLayout();
      App.applicationRegion.show(App.applicationLayout);
      App.start();

      // Listen resize sidebar message 
      App.vent.on('leftSidebar', function (type) {
        
        App.applicationLayout.resizeSidebar(type);
      });

      // Listen collapse header & sidebar message
      App.vent.on('collapseUI', function (type) {

        App.applicationLayout.collapseUI(type);
      });
    });
  }
);
