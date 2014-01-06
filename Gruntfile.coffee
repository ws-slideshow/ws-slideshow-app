module.exports = (grunt) ->

  path = require 'path'
  pkg = require './package.json'

  grunt.initConfig(

    # package
    # ------------------------------------------------------------
    pkg: pkg

    # pathes
    # ------------------------------------------------------------
    pathes:
      src: 'src'
      dist: 'dist'
      vendor: 'vendor'
      tmp: 'tmp'
      test: 'test'

    meta:
      banner: '''
        /*!
        app: <%= pkg.name %> - <%= pkg.description %>
        version: <%= pkg.version %>
        url: <%= pkg.homepage %>
        author: <%= pkg.author %>
        date: <%= grunt.template.today("yyyy-mm-dd") %>
        */
        '''

    # clean
    # ------------------------------------------------------------
    clean:
      dist: [
        '<%= pathes.dist %>/*'
      ]
      tmp: [
        '<%= pathes.tmp %>'
      ]

    # coffee
    # ------------------------------------------------------------
    coffee:
      debug:
        options:
          join: true
          bare: true
          sourceMap: true
        files:
          '<%= pathes.dist %>/js/<%= pkg.name %>.js':'<%= pathes.src %>/app/<%= pkg.name %>.coffee'
      release:
        options:
          join: true
          bare: true
        files:
          '<%= pathes.tmp %>/js/<%= pkg.name %>.<%= pkg.version %>.js': '<%= pathes.src %>/app/<%= pkg.name %>.coffee'

    #  references for index.html
    # ------------------------------------------------------------

    htmlrefs:
      release:
        src: '<%= pathes.src %>/app/index.html'
        dest: '<%= pathes.dist %>/'
        options:
          version: '<%= pkg.version %>'

    # uglify
    # ------------------------------------------------------------
    uglify:
      options:
        mangle: false
        compress:
          dead_code: false
          unused: false
          if_return: true
      release:
        files:
          '<%= pathes.dist %>/js/<%= pkg.name %>.<%= pkg.version %>.min.js': [
            '<%= pathes.tmp %>/js/<%= pkg.name %>.lib.js'
            '<%= pathes.tmp %>/js/<%= pkg.name %>.<%= pkg.version %>.js'
          ]

    # copy
    # ------------------------------------------------------------
    copy:
      debugjs:
      # all js (incl. source maps related files)
        files:[
          expand: true,
          cwd: '<%= pathes.tmp %>/js/'
          src: [
            '**.js'
            '**.map'
          ],
          dest: '<%= pathes.dist %>/js/'
          filter: 'isFile'
        ]
      debugindex:
      # index.html
        files:[
          expand: true,
          cwd: '<%= pathes.src %>/app/'
          src: [
            'index.html'
          ],
          dest: '<%= pathes.dist %>/',
          filter: 'isFile'
        ]

    # concat
    # ------------------------------------------------------------
    concat:
      jslib:
        src: [
          '<%= pathes.vendor %>/zepto/zepto.js'
          '<%= pathes.vendor %>/angular/angular.js'
          '<%= pathes.vendor %>/angular-animate/angular-animate.js'
          '<%= pathes.vendor %>/angular-resource/angular-resource.js'
          '<%= pathes.vendor %>/angular-route/angular-route.js'
          '<%= pathes.vendor %>/angular-touch/angular-touch.js'
          '<%= pathes.vendor %>/Snap.svg/dist/snap.svg.js'
        ]
        dest:
          '<%= pathes.tmp %>/js/<%= pkg.name %>.lib.js'

    # connect
    # ------------------------------------------------------------
    connect:
      options:
        port: 9001
        hostname: 'localhost'
      debug:
        options:
          base: 'dist'
      release:
        options:
          keepalive: true
          base: 'dist'

    # lint
    # ------------------------------------------------------------
    coffeelint:
      options:
        'max_line_length':
          'value': 80,
          'level': 'warn'
      app:
        files:
          src: [
            '<%= pathes.src %>/app/**/*.coffee'
          ]
      test:
        files:
          src: [
            '<%= pathes.test %>/**/*.coffee'
          ]
      grunt:
        files:
          src: 'Gruntfile.coffee'

    # karma
    # ------------------------------------------------------------
    karma:
      unit:
        configFile: 'test/karma.conf.coffee'
        runnerPort: 9201


    # watch
    # ------------------------------------------------------------
    watch:
      options:
        livereload: true
      coffee:
        files: [
          '<%= pathes.src %>/app/**/*.coffee'
        ],
        tasks: [
          'coffee:debug'
        ]
      grunt:
        files: [
          'Gruntfile.coffee'
        ],
        tasks: [
          'coffeelint:grunt'
        ]
      karma:
        files: [
          '<%= pathes.src %>/app/**/*.coffee'
          '<%= pathes.test %>/**/*.coffee'
        ],
        tasks: [
          'karma:unit:run'
        ]

  )

  # tasks
  # ------------------------------------------------------------

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-html2js'
  grunt.loadNpmTasks 'grunt-htmlrefs'
  grunt.loadNpmTasks 'grunt-karma'


  grunt.registerTask 'debug', [
    'clean'
    'coffeelint:app'
    'coffee:debug'
    'concat:jslib'
    'copy:debugjs'
    'copy:debugindex'
    'connect:debug'
    'watch'
  ]

  grunt.registerTask 'release', [
    'clean'
    'coffeelint:app'
    'coffee:release'
    'concat:jslib'
    'uglify:release'
    'htmlrefs:release'
    'connect:release'

  ]

  # test tasks
  # ------------------------------------------------------------
  grunt.registerTask 'test:unit', [
    'clean'
    'concat:jslib'
    'copy:debugjs'
    'coffeelint:app'
    'coffeelint:test'
    'coffee:debug'
    'karma:unit'
  ]


  grunt.registerTask 'default', [
    'debug'
  ]