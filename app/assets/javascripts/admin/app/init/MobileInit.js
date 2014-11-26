/*
 * Include Desktop Specific JavaScript files here (or inside of your Desktop
 * Controller, or differentiate based off App.mobile === false)
 */  
require(
  [
    'App', 
    'jquery', 
    'routers/router', 
    'controllers/MobileController', 
    'backbone', 
    'marionette', 
    'jquerymobile', 
    'backbone.validateAll',
    'backbone.routefilter'
  ],
  function (App, $, MainRouter, AppController) {

    // Prevents all anchor click handling
    $.mobile.linkBindingEnabled = false;
    // Disabling this will prevent jQuery Mobile from handling hash changes
    $.mobile.hashListeningEnabled = false;

    App.mainRouter = new MainRouter({
        controller: new AppController()
    });

    App.start();
  }
);
