define(
  [
    'app',
    'hbs!templates/shared/sidebar/left/group-function'
  ], function (App, groupFunctionTemplate) {
    
    return Backbone.Marionette.CompositeView.extend({
      template: groupFunctionTemplate,
      tagName: 'li',
      
      initialize: function () {

        // Grab the child collection from the parent model
        // so that we can render the collection as children
        // of this parent node
        this.collection = this.model.children;
      },

      appendHtml: function(collectionView, itemView){
        // ensure we nest the child list inside of 
        // the current list item
        collectionView.$("li:first").append(itemView.el);
      }
    });
  }
);
