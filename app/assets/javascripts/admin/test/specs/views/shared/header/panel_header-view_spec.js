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
          _resizeMessage,
          panelHeaderTemplate;

      _resizeMessage = [
        { current: 'normal', input: 'smallButton', output: 'small' },
        { current: 'normal', input: 'mediumButton', output: 'medium' },
        { current: 'small', input: 'smallButton', output: 'normal' },
        { current: 'small', input: 'mediumButton', output: 'medium' },
        { current: 'medium', input: 'smallButton', output: 'small' },
        { current: 'medium', input: 'mediumButton', output: 'normal' }
      ];

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

      /**
       * Function _resizeSidebarMessage
       *
       * Unit test for each case in send sidebar message with various 
       * input case.
       *
       * Arguments:
       *   - tabular { current, input, output }
       **/
      function _resizeSidebarMessage (tabular) {

        it('should be send resize sidebar message [O]: ' + tabular.output + 
            ' with [I]: ' + tabular.input + ', [C]: ' + tabular.current, 
          function () {

            spyOn(App.vent, 'trigger');
            panelHeader._currentActived = tabular.current;
            (panelHeader.ui)[tabular.input].click();

            expect(App.vent.trigger).toHaveBeenCalledWith('leftSidebar', tabular.output); 
          }
        );
      }

      for (var i = 0; i < _resizeMessage.length; i++) {
        _resizeSidebarMessage(_resizeMessage[i]);
      }
    });
  }
);
