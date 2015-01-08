define(['templates/helpers/breadcrumb'], function (breadcrumbHelper) {

  describe('Breadcrumb helper', function () {
  
    var input = [ { path: '!rooms-list', pathName: 'Room List' } ],
        output = '<li class="active">Room List</li>';

    it('should be render list of links', function () {
    
      expect(breadcrumbHelper(input)).toEqual(output);
    });
  });

}); 
