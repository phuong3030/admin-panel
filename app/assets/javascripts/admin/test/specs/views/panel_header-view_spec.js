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
          _resizeSidebar,
          panelHeaderTemplate;

      beforeEach(function () {

        panelHeader = new PanelHeader();
        panelHeaderTemplate = panelHeader.template();
        panelHeader.render();
      });

      it('should have nav-medium-button element', function () {

        expect(panelHeaderTemplate).toContain('nav-medium-button');
      });

      it('should have nav-small-button element', function () {

        expect(panelHeaderTemplate).toContain('nav-small-button');
      });

      it('should be called resizeSidebar', function () {

        // Re-create panelheader instance with spied listener method
        spyOn(PanelHeader.prototype, 'resizeSidebar');
        panelHeader = new PanelHeader();
        panelHeader.render();

        panelHeader.ui.mediumButton.click();
        expect(panelHeader.resizeSidebar).toHaveBeenCalled();
      });

      it('should be send resize sidebar message to application', function (){

        spyOn(App.vent, 'trigger');

        panelHeader.ui.smallButton.click();

        expect(App.vent.trigger).toHaveBeenCalledWith('leftSidebar', 'small');

        panelHeader.ui.mediumButton.click();

        expect(App.vent.trigger).toHaveBeenCalledWith('leftSidebar', 'medium');
      });
    });
  }
);
