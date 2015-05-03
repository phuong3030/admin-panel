define(
  [
    'app',
    'hbs!templates/shared/header/notifications'
  ], function (App, notificationsTemplate) {
    
    return Backbone.Marionette.CompositeView.extend({
      template: notificationsTemplate,
      tagName: 'li',
      
      initialize: function () {
      },

      onRender: function() {

      },

      attachHtml: function(collectionView, itemView, index){
        /* 
         * Ensure we nest the child list inside of 
         * the current list item
         */
        //collectionView.$(".child-menu ul").append(itemView.el);
      }
    });
  }
);
