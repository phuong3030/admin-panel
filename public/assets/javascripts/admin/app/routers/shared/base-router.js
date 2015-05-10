define(['app'], function (App) {

  /*
   * Base router 
   * Store the sub-application name and handle route filter
   */
  return Backbone.Marionette.AppRouter.extend({
    _appName: '',

    before: function () { 
      
      App.startSubApp(this._appName);
    }, 
    
    after: function (route, param) {

      App.vent.trigger('Headingchanged', { route: route, params: param });
    }
  });
});
