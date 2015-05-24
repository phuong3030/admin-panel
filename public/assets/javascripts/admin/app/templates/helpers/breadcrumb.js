define(['handlebars'], function (Handlebars) {

  var ROUTEMAPS = {
    'admin': { name: 'Default Dashboard', url: '/admin' }
  };

  function breakPaths (paths) {
    
    if(paths.length > 0) {

      return paths.map(function (el) { return ROUTEMAPS[el]; });
    } else {

      return [];
    }
  }

  function breadcrumb(context, options) {

    var i, output = '',
        paths = window.location.pathname.substr(1).split('/'),
        breads = breakPaths(paths);

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
  }


  Handlebars.registerHelper('breadcrumb', breadcrumb);

  return {
    breadcrumb: breadcrumb,
    breakPaths: breakPaths,
    routemaps: ROUTEMAPS
  };
});
