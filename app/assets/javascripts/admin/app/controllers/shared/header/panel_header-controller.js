define(['app', 'views/header/panel_header-view'], function (App, PanelHeaderView) {

  return Backbone.Marionette.Controller.extend({
    initialize: function () {
      this.createPanelHeader();
    },

    // Render panel (logo and resize button)
    createPanelHeader: function () {
      
      var panelHeader = new PanelHeaderView();

      App.headerLayout.panelHeaderRegion.show(panelHeader);
    }
  });
});
