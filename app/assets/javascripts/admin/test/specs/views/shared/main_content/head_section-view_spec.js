define(
  ['app', 'views/shared/main_content/head_section-view'],
  function (App, HeadSectionView) {

    describe('Head section view', function () {

      var headSection,
          _collapseUIMessage;

      _collapseUIMessages = [
        { current: 'none', input: 'collapseHeaderButton', output: 'header' },
        { current: 'none', input: 'collapseSidebarButton', output: 'sidebar' },
        { current: 'none', input: 'collapseAllButton', output: 'fullscreen' },
        { current: 'header', input: 'collapseHeaderButton', output: 'none' },
        { current: 'header', input: 'collapseSidebarButton', output: 'sidebar' },
        { current: 'header', input: 'collapseAllButton', output: 'fullscreen' },
        { current: 'sidebar', input: 'collapseHeaderButton', output: 'header' },
        { current: 'sidebar', input: 'collapseSidebarButton', output: 'none' },
        { current: 'sidebar', input: 'collapseAllButton', output: 'fullscreen' },
        { current: 'fullscreen', input: 'collapseHeaderButton', output: 'header' },
        { current: 'fullscreen', input: 'collapseSidebarButton', output: 'sidebar' },
        { current: 'fullscreen', input: 'collapseAllButton', output: 'none' }
      ];

      beforeEach(function () {
      
        headSection = new HeadSectionView();
        headSection.render();
      });
    
      it('should be display breadcrum', function () {

        expect(headSection.$el.find('.breadcrumb')).toBeTruthy();
      });

      it('should be display collapse function buttons', function () {
      
        expect(headSection.$el.find('.remove-sidebar')).toBeTruthy();
        expect(headSection.$el.find('.remove-header')).toBeTruthy();
        expect(headSection.$el.find('.remove-all')).toBeTruthy();
      });

      function testCollapseUI (collapseMessage) {

        it('should send [O]: ' + collapseMessage.output + ' with [I]: ' +
          collapseMessage.input + ' and [C]: ' + collapseMessage.current, 
          function () {

            spyOn(App.vent, 'trigger');
            headSection._currentCollapsedItem = collapseMessage.current;
            headSection.ui[collapseMessage.input].click();

            expect(App.vent.trigger).toHaveBeenCalledWith('collapseUI', collapseMessage.output);
          }
        );
      }

      for(var i = 0; i < _collapseUIMessages.length; i++) {
        testCollapseUI(_collapseUIMessages[i]);
      }
    });
  }
);
