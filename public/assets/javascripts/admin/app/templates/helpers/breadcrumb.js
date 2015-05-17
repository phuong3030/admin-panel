define(['handlebars'], function (Handlebars) {

  function breakBreads () {
    
    console.log(window.location.origin);
  }

  function breadcrumb(breads, options) {

    var i, output = '';

    breakBreads();

    for (i = 0; i < breads.length; i++) {
      if (i !== breads.length - 1) {

        output += '<li><a href="' + breads[i].path + '">' + 
            breads[i].pathName + '</a><li>';
      } else {

        output += '<li class="active">' + breads[i].pathName + '</li>';
      }
    }

    return new Handlebars.SafeString(output);
  }


  Handlebars.registerHelper('breadcrumb', breadcrumb);

  return breadcrumb;
});
