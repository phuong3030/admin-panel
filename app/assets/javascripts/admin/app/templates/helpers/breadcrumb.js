define(['handlebars'], function ( Handlebars ){

  function breadcrumbHelper ( breads, options ) {

    var i, output = '';

    for (i = 0; i < breads.length; i++) {
      if (i !== breads.length - 1) {

        output += '<li><a href="' + breads[i].path + '">' + 
            breads[i].pathName + '</a><li>';
      } else {

        output += '<li class="active">' + breads[i].pathName + '</li>';
      }
    }

    return output;
  }

  Handlebars.registerHelper( 'breadcrumb', breadcrumbHelper );

  return breadcrumbHelper;
});
