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

      var panelHeader,
          panelHeaderTemplate;

      beforeEach(function () {

        panelHeader = new PanelHeader();
        panelHeaderTemplate = panelHeader.template();
      });

      it('should have nav-medium-button element', function () {

        expect(panelHeaderTemplate).toContain('nav-medium-button');
      });

      it('should have nav-small-button element', function () {

        expect(panelHeaderTemplate).toContain('nav-small-button');
      });

      it('should be send resize command to application', function () {

        var spy = spyOn(panelHeader, 'resizeSidebar');

        panelHeader.$('.nav-medium-button').trigger('click');
        expect(spy).toHaveBeenCalled();
      });
    });
  }
);
