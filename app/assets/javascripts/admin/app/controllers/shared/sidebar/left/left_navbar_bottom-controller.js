define(
  [
    'app', 
    'views/shared/sidebar/left/left_navbar_bottom_widget-view'
  ], 
  function (App, BottomWidgetView) {

    return Backbone.Marionette.Controller.extend({
      // Create right header menu
      createBottomWidget: function () {
      
        var bottomWidget = new BottomWidgetView();

        App.leftSidebarRegion.attachView(bottomWidget);
      }   
    });
  }
);
