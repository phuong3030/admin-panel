define(
  ['app', 'views/shared/main_content/head_section-view'],
  function (App, HeadSectionView) {
    return Backbone.Marionette.Controller.extend({
      createHeadSection: function () {

        this.headSectionView = new HeadSectionView();
        App.headSectionRegion.show(this.headSectionView);
      },
      
      _genBreadcrumb: function (route) {
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
