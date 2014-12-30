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

        _resizeSidebar = PanelHeader.prototype.resizeSidebar;
        spyOn(PanelHeader.prototype, 'resizeSidebar');

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

        panelHeader.ui.mediumButton.trigger('click');
        expect(panelHeader.resizeSidebar).toHaveBeenCalled();
      });

      it('should be send resize sidebar message to application', function (){

        PanelHeader.prototype.resizeSidebar = _resizeSidebar;
      });
    });
  }
);
