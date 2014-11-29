/*
 * Panel Header View
 *
 * Use for render header html struture
 */
define(
  [
    'app', 
    'backbone', 
    'marionette', 
    'jquery', 
    'hbs!templates/shared/header/panel_header'
  ],
  function (App, Backbone, Marionette, $, panelHeaderTemplate) {

    return Backbone.Marionette.ItemView.extend( {
      template: panelHeaderTemplate,

      // View Event Handlers
      events: {

      }
    });
  }
);
