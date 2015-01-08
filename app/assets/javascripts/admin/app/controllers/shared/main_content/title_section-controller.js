define(
  [
    'app', 
    'views/shared/main_content/title_section-view',
    'models/shared/route_map'
  ],
  function (App, TitleSectionView, RouteMap) {
    return Backbone.Marionette.Controller.extend({
      createTitleSection: function () {

        App.routeMap = new RouteMap();
        App.routeMap.fetch();
        this.titleSectionView = new TitleSectionView({ model: App.routeMap });

        App.titleSectionRegion.show(this.titleSectionView);
      },
      
      bindEvents: function () {

        App.vent.on('changeHeading', function (route) { 
        
          App.routeMap.set('current', App.routeMap.get(route));
        });
      },

      unbindEvents: function () {

        App.vent.off('changeHeading');
      }
    });
  }
);
