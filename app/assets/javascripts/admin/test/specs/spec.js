// Jasmine Unit Testing Suite
define(["jquery", "backbone", "marionette", "models/user", "collections/Collection"],
    function($, Backbone, Marionette, User, Collection) {
        // Test suite that includes all of the Jasmine unit tests
        describe("Marionette-Require-Boilerplate (MRB)", function() {
            // Marionette App Suite: contains all tests related to views
            describe("Desktop Marionette App instantiation", function() {
                //Initialize App in Desktop Mode (App is global var)
                App.start();
                it("App should start and have Regions", function() {
                });

            }); // End of the App test suite*/

            // Marionette View Suite: contains all tests related to views
            describe("Marionette Views", function() {
                it("Instantiate some Views", function() {
                });
            }); // End of the View test suite*/

            // Backbone Model Suite: contains all tests related to models
            describe("Backbone models", function() {

                // Runs before every Model spec
                beforeEach(function() {
                    // Instantiates a new Model instance
                    this.user = new User();

                    // We are spying on the _validate method to see if it gets called
                    spyOn(User.prototype, "validate").andCallThrough();
                });

                it("should be in a valid state", function() {
                    expect(this.user.isValid()).toBe(true);
                });

                it("should call the validate method when setting a property", function() {
                    this.user.set({ example: "test" }, { validate: true });
                    expect(User.prototype.validate).toHaveBeenCalled();
                });

            }); // End of the Model test suite

            // Backbone Collection Suite: contains all tests related to collections
            describe("Backbone collections", function() {
                // Runs before every Collection spec
                beforeEach(function() {
                    // Instantiates a new Collection instance
                    this.collection = new Collection();
                });

                it("should contain the correct number of models", function() {
                    expect(this.collection.length).toEqual(0);
                });

            }); // End of the Collection test suite
        }); // End of the MRB test suite

});
