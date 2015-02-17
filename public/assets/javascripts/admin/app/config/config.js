require.config({
  baseUrl:'/assets/javascripts/admin/app',
  paths:{
    // Core Libraries
    'jquery':'../libs/jquery',
    'jqueryui':'../libs/jqueryui',
    'jquerymobile':'../libs/jquery.mobile',
    'underscore':'../libs/lodash',
    'backbone':'../libs/backbone',
    'marionette':'../libs/backbone.marionette',
    'handlebars':'../libs/handlebars',
    'hbs':'../libs/hbs',
    'i18nprecompile':'../libs/i18nprecompile',
    'json2':'../libs/json2',
    'jasmine': '../libs/jasmine',
    'jasmine-html': '../libs/jasmine-html',

    // Plugins
    'backbone.validateAll':'../libs/plugins/Backbone.validateAll',
    'backbone.routefilter':'../libs/plugins/backbone.routefilter',
    'bootstrap':'../libs/plugins/bootstrap',
    'text':'../libs/plugins/text',
    'jasminejquery': '../libs/plugins/jasmine-jquery'
  },
  // Sets the configuration for your third party scripts that are not AMD compatible
  shim:{
    'bootstrap':['jquery'],
    'jqueryui':['jquery'],
    'jquerymobile':['jqueryui'],
    'jasminejquery': ['jquery'],

    'backbone':{
      'deps':['underscore', 'jquery'],
      'exports':'Backbone'
    },
    'marionette':{
      'deps':['underscore', 'backbone', 'jquery'],
      'exports':'Marionette'
    },
    'handlebars':{
      'exports':'Handlebars'
    },
    'backbone.validateAll':['backbone'],

    'jasmine': {
      'exports': 'jasmine'
    },

    'jasmine-html': {
      'deps': ['jasmine'],
      'exports': 'jasmine'
    }
  },
  hbs: {
    templateExtension: 'html',
    helperDirectory: 'templates/helpers/',
    i18nDirectory: 'templates/i18n/',

    compileOptions: {}
  }
});
