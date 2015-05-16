define(
  [
    'hbs!templates/shared/main-content/head-section',
    'jasminejquery'
  ], function (HeadSection) {

    describe('Head section template', function () {

      var headSection = $('<div>' + HeadSection() + '</div>');

      it('should be contained breadcrumb list', function () {
         
        expect(headSection).toContainElement('.breadcrumb');
      });

      it('should be contained remove header button', function () {

        expect(headSection).toContainElement('.remove-header-button');
      });

      it('should be contained remove sidebar button', function () {

        expect(headSection).toContainElement('.remove-sidebar-button');
      });

      it('should be contained fullscreen button', function () {

        expect(headSection).toContainElement('.fullscreen-button');
      });
    });
  }
);
