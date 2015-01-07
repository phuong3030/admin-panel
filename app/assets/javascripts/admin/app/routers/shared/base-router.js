define(['app'], function (App) {

  return Backbone.Marionette.AppRouter.extend({
    _appName: '',

    before: function () { 
      
      App.startSubApp(this._appName);
    }, 
    
    after: function (route, param) {

      App.vent.trigger('changeHeading', route);
    }
  });
});
