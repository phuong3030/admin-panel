define(['app', 'views/shared/header/panel_header-view'], function (App, PanelHeaderView) {

  return Backbone.Marionette.Controller.extend({
    // Render panel (logo and resize button)
    createPanelHeader: function () {
      
      var panelHeader = new PanelHeaderView();

      App.headerLayout.panelHeaderRegion.show(panelHeader);
    }
  });
});
