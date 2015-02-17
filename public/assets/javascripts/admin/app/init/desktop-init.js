/*
 * Main app starting point
 */
require(
  [
    'app', 
    'routers/router', 
    'controllers/application',
    'views/layouts/application',
    'jquery', 
    'backbone', 
    'marionette', 
    'bootstrap', 
    'backbone.validateAll',
    'backbone.routefilter'
  ],
  function (App, MainRouter, AppController, ApplicationLayout) {

    // Show application layout first
    App.addInitializer(function() {
    
      var that = this;

      this.applicationLayout = new ApplicationLayout();

      this.application.show(this.applicationLayout);

      // Listen resize sidebar message 
      App.vent.on('leftSidebar', function (type) {
        
        that.applicationLayout.resizeSidebar(type);
      });

      // Listen collapse header & sidebar message
      App.vent.on('collapseUI', function (type) {

        that.applicationLayout.collapseUI(type);
      });
    });

    App.mainRouter = new MainRouter({
      controller: new AppController()
    });

    App.start();
  }
);
