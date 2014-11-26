define( ['App', 'backbone', 'marionette', 'jquery', 'models/taxon', 'hbs!templates/taxon'],
    function(App, Backbone, Marionette, $, Model, template) {
        //ItemView provides some default rendering logic
        return Backbone.Marionette.ItemView.extend( {
            template: template,
            model: new taxon({
                mobile: App.mobile
            }),

            // View Event Handlers
            events: {

            }
        });
    });
