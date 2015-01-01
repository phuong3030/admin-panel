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

    return Backbone.Marionette.ItemView.extend({
      template: panelHeaderTemplate,
      className: 'panel-header',
      ui: {
        mediumButton: '.nav-medium-button',
        smallButton: '.nav-small-button' 
      },

      _currentActived: 'normal',      

      // View Event Handlers declaration
      events: {
        'click @ui.mediumButton': 'resizeSidebar',
        'click @ui.smallButton': 'resizeSidebar'
      },

      // Event handlers
      resizeSidebar: function (e) {
        
        var clickedButton = e.currentTarget === this.ui.mediumButton[0] ? 'medium' : 'small';

        if (this._currentActived !== clickedButton) {

          this._currentActived = clickedButton;
          App.vent.trigger('leftSidebar', clickedButton);
        } else {

          this._currentActived = 'normal';
          App.vent.trigger('leftSidebar', 'normal');
        }
      }
    });
  }
);
