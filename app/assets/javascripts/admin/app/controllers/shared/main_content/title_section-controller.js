define(
  [
    'app', 
    'views/shared/main_content/title_section-view',
    'models/shared/route'
  ],
  function (App, TitleSectionView, RouteModel) {
    return Backbone.Marionette.Controller.extend({
      createTitleSection: function () {

        this.route = new RouteModel();
        this.route.fetch();
        this.titleSectionView = new TitleSectionView({ model: this.route });

        App.titleSectionRegion.show(this.titleSectionView);
      },
      
      bindEvents: function () {

        var that = this;

        App.vent.on('changeHeading', function (route) { 
        
          that.route.set('current', that.route.get(route));
        });
      },

      unbindEvents: function () {

        App.vent.off('changeHeading');
      }
    });
  }
);
