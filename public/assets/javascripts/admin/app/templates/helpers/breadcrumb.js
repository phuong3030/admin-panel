define(['handlebars'], function (Handlebars) {

  var Breadcrumb = {};

  Breadcrumb.ROUTEMAPS = {
    'admin': { name: 'Default Dashboard', url: '/admin' }
  };

  Breadcrumb.breakPaths = function (paths) {
    
    if(paths.length > 0) {

      return paths.map(function (el) { return Breadcrumb.ROUTEMAPS[el]; });
    } else {

      return [];
    }
  };

  Breadcrumb.getPathname = function () {

    return window.location.pathname.substr(1).split('/');
  };

  Breadcrumb.breadcrumb = function (context, options) {

    var i, output = '',
        breads = Breadcrumb.breakPaths(Breadcrumb.getPathname());

    if (breads.length > 0) {

      for (i = 0; i < breads.length; i++) {
        if (breads[i]) {

          if (i === 0) {

            output += '<li class="active">' + breads[i].name + '</li>';
          } else {

            output += '<li><a href="' + breads[i].url + '">' + breads[i].name + '</a><li>';
          }
        }
      }

      return new Handlebars.SafeString(output);
    } else {

      return '';
    }
  };


  Handlebars.registerHelper('breadcrumb', Breadcrumb.breadcrumb);

  return Breadcrumb;
});
