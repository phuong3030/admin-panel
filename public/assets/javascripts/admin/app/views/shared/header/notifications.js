define(
  [
    'app',
    'hbs!templates/shared/header/notifications'
  ], function (App, notificationsTemplate) {
    
    return Backbone.Marionette.CompositeView.extend({
      template: notificationsTemplate,
      
      initialize: function () {

      },

      onRender: function() {

        // NOTE: We will remove this trick when Marionette upto version 3
        // Marionette will supports 'replaceElement' method to replace view to
        // the region element
        /* 
         * Get rid of that pesky wrapping-div.
         * Assumes 1 child element present in template.
         */
        this.$el = this.$el.children();
        /* 
         * Unwrap the element to prevent infinitely 
         * nesting elements during re-render.
         */
        this.$el.unwrap();
        this.setElement(this.$el);
      },

      attachHtml: function(collectionView, itemView, index){
        // Ensure we nest the child list inside of the current list item
        //collectionView.$(".child-menu ul").append(itemView.el);
      }
    });
  }
);
