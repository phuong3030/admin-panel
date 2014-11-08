// Overwrite this file in your application /app/assets/javascripts/comfortable_mexican_sofa/admin/application.js 
window.CMS.wysiwyg = function() {
  return tinymce.init({
    selector: 'textarea[data-cms-rich-text]',
    theme: 'modern',
    plugins: [
      'advlist autolink link image lists charmap preview hr pagebreak',
      'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
      'table contextmenu textcolor paste textcolor colorpicker textpattern'
    ],
    toolbar1: 'newdocument | bold italic underline | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect',
    toolbar2: 'searchreplace | bullist numlist | outdent indent blockquote | undo redo | link unlink image media code | insertdatetime preview | forecolor backcolor' +
              'table | hr removeformat | subscript superscript | charmap fullscreen | ltr rtl | visualchars visualblocks nonbreaking pagebreak',

    style_formats: [
      {title: 'Bold text', inline: 'b'},
      {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
      {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
      {title: 'Example 1', inline: 'span', classes: 'example1'},
      {title: 'Example 2', inline: 'span', classes: 'example2'},
      {title: 'Table styles'},
      {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
    ],
    formats: {
      alignleft: {selector: 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img', classes: 'left'},
      aligncenter: {selector: 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img', classes: 'center'},
      alignright: {selector: 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img', classes: 'right'},
      alignfull: {selector: 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img', classes: 'full'},
      bold: {inline: 'span', 'classes': 'bold'},
      italic: {inline: 'span', 'classes': 'italic'},
      underline: {inline: 'span', 'classes': 'underline', exact: true},
      strikethrough: {inline: 'del'},
      customformat: {inline: 'span', styles: {color: '#00ff00', fontSize: '20px'}, attributes: {title: 'My custom format'}}
    },
    height: 300,
    image_advtab: true,
    menubar: false,
    statusbar: true,
    relative_urls: true,
    object_resizing : true
  });
};
