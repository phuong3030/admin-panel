module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    requirejs: {
      mobileJS: {
        options: {
          baseUrl: 'javascripts/admin/app',
          wrap: true,
          // Don't use almond if your project needs to load modules dynamically
          name: '../libs/almond',
          preserveLicenseComments: false,
          optimize: 'uglify',
          findNestedDependencies: true,
          mainConfigFile: 'javascripts/admin/app/config/config.js',
          include: ['init/mobile-init'],
          out: 'javascripts/admin/app/init/mobile-init.min.js',

          /*
           * https://github.com/SlexAxton/require-handlebars-plugin
           */
          pragmasOnSave: {
            //removes Handlebars.Parser code (used to compile template strings) set
            //it to `false` if you need to parse template strings even after build
            excludeHbsParser : true,
            // kills the entire plugin set once it's built.
            excludeHbs: true,
            // removes i18n precompiler, handlebars and json2
            excludeAfterBuild: true
          },

          locale: 'en_us',

          // options object which is passed to Handlebars compiler
          hbs : {
            templateExtension: 'html',
            helperDirectory: 'templates/helpers/',
            i18nDirectory: 'templates/i18n/',

            compileOptions: {}
          }
        }
      },
      desktopJS: {
        options: {
          baseUrl: 'javascripts/admin/app',
          wrap: true,
          // Cannot use almond since it does not currently appear to support requireJS's config-map
          name: '../libs/almond',
          preserveLicenseComments: false,
          findNestedDependencies: true,
          optimize: 'uglify',
          mainConfigFile: 'javascripts/admin/app/config/config.js',
          include: ['init/desktop-init'],
          out: 'javascripts/admin/app/init/desktop-init.min.js'
        }
      }
    },
    sass: {
      dev: { 
        options: {
          style: 'expanded',
          compass: false
        },
        files: {
          'stylesheets/admin/desktop.css': 'stylesheets/admin/desktop.scss',
          'stylesheets/admin/mobile.css': 'stylesheets/admin/mobile.scss'
        }
      },
      dist: {
        options: {
          style: 'compressed',
          compass: false
        },
        files: {
          'stylesheets/admin/desktop.min.css': 'stylesheets/admin/desktop.scss',
          'stylesheets/admin/mobile.min.css': 'stylesheets/admin/mobile.scss'
        }
      }
    },
    jshint: {
      files: ['Gruntfile.js', 'javascripts/admin/app/**/*.js', '!javascripts/admin/app/**/*min.js'],
      options: {
        globals: {
          jQuery: true,
          console: false,
          module: true,
          document: true
        }
      }
    },
    watch: {
      css: {
        files: ['stylesheets/admin/*.scss'],
        tasks: ['sass:dev'],
        options: {
          spawn: false
        }
      }
    },
    uglify: {
      dist: {
        options: {
          expand: true,
          flatten: true
        },
        files: {
          'javascripts/admin/app/config/config.min.js': ['javascripts/admin/app/config/config.js']
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-requirejs');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.registerTask('test', ['jshint', 'sass:dev']);
  grunt.registerTask('build', ['uglify:dist', 'requirejs:desktopJS', 'requirejs:mobileJS', 'sass:dist']);
  grunt.registerTask('default', ['test', 'build']);
};
