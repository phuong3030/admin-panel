/*
 * Main Layout
 *
 * Use for render header html struture
 */
define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery',
    'hbs!templates/layouts/application'
  ],
  function (App, Backbone, Marionette, $, applicationTemplate) {

    return Backbone.Marionette.LayoutView.extend( {
      template: applicationTemplate,

      // Listener for handle resize button event
      events: {

      }
    });
  }
)