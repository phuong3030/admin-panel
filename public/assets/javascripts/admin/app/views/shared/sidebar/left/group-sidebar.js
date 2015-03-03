define(
  [
    'app',
    'collections/navbar',
    'hbs!templates/shared/sidebar/left/group-sidebar'
  ], function (App, Navbar, groupSidebarTemplate) {
    
    return Backbone.Marionette.CompositeView.extend({
      template: groupSidebarTemplate,
      tagName: 'li',
      
      initialize: function () {

        var childMenus = this.model.get('children');

        // Grab the child collection from the parent model
        // so that we can render the collection as children
        // of this parent node
        if (childMenus.length > 0) {

          this.collection = new Navbar(childMenus);
        } 
      },

      onRender: function() {

        // This node doesn't have childmenus
        if (_.isUndefined(this.collection)){

          // Remove empty childmenu's wrapper HTML 
          this.$('.child-menu').remove();
          // Remove dropdown icon
          this.$('.menu-badge').remove();
          // Remove toggle class
          this.$('a.toggle-menu').removeClass();
        } else {

          this.$('a.toggle-menu').addClass('sub-menu');
        }
      },

      attachHtml: function(collectionView, itemView, index){
        // Ensure we nest the child list inside of 
        // the current list item
        collectionView.$(".child-menu ul").append(itemView.el);
      }
    });
  }
);
