define(
  ['app', 'views/shared/main_content/head_section-view'],
  function (App, HeadSectionView) {
    return Backbone.Marionette.Controller.extend({
      createHeadSection: function () {

        this.headSectionView = new HeadSectionView();
        App.headSectionRegion.show(this.headSectionView);
      },
      
      genBreadcrumb: function (route) {
      }
    });
  }
);
