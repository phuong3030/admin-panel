define(
  [
    'app', 
    'views/shared/main_content/head_section-view',
    'models/shared/breadcrumb'
  ],
  function (App, HeadSectionView, Breadcrumb) {
    return Backbone.Marionette.Controller.extend({
      createHeadSection: function () {

        this.model = new Breadcrumb();
        this.headSectionView = new HeadSectionView({ model: this.model });
        App.headSectionRegion.show(this.headSectionView);
      },
      
      _genBreadcrumb: function (route) {

        var i, temp, breads = [],
            routes = route.substring(1, route.length).split('/');

        for (i = 0; i < routes.length; i++) {
          temp = '!' + routes[i];
          breads.push({
            path: temp,
            pathName: App.routeMap[temp]
          });
        }

        this.model.set('breads', breads);
      },

      bindEvents: function () {

        var that = this;

        App.vent.on('changeHeading', function (route) {
        
          that._genBreadcrumb(route);
        });
      },

      unbindEvents: function () {

        App.vent.off('changeHeading');
      }
    });
  }
);
