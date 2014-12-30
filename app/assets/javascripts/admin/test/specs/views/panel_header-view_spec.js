define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'views/shared/header/panel_header-view'
  ],
  function (App, Backbone, Marionette, $, PanelHeader) {

    describe('Resize left sidebar', function () {

      var panelHeader = new PanelHeader();

      beforeEach(function () {

        panelHeader = new PanelHeader();
      });

      it('should have nav-medium-button', function () {

        //expect($('.panel-menu')).toContain($('.nav-medium-button'));
      });

      it('should have nav-small-button', function () {

        //expect($('.nav-small-button')).toBeInDom();
      });

      it('should be send resize command to application'); 
    });
  }
);
