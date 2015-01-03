define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'hbs!templates/shared/main_content/head_section'
  ],
  function (App, Backbone, Marionette, $, titleTemplate) {

    return Backbone.Marionette.View.extend({
      template: titleTemplate,
      className: 'panel-header',

      ui: {

      },

      events: {
      }
    });
  }
);

