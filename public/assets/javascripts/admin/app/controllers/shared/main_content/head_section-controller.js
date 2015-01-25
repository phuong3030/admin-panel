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

        var i, temp, last = {}, breads = [],
            routes = route.substring(1, route.length).split('/'),
            lastPath = routes[routes.length -1];

        for (i = 0; i < routes.length - 1; i++) {
          temp = '!' + routes[i];

          breads.push({
            path: temp,
            pathName: App.routeMap.get(temp)
          });
        }

        last = {
          path: route, 
          pathName: App.routeMap.get(lastPath)
        };

        if (lastPath === ':id') {

          last.pathName = route.params[0];
        }

        this.model.set({ 
          'breads': breads,
          'last': last
        });
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
