module.exports = (karma) ->
  karma.set

    # base path, that will be used to resolve files and exclude
    basePath: '../'

    frameworks: [
      'mocha'
      'chai'
      'sinon'
    ]

    # list of files / patterns to load in the browser
    files: [
      'dist/js/ws-slideshow.lib.js'
      'tmp/js/ws-slideshow.js'
      'vendor/angular-mocks/angular-mocks.js'
      'dist/js/ws-slideshow.*.js'
      'test/unit/**/*.coffee'
    ]

    # list of files to exclude
    exclude: []

    # test results reporter to use
    # possible values: dots || progress || growl
    reporters: [
      'progress'
      'dots'
    ]

    # web server port
    port: 9878

    # cli runner port
    runnerPort: 9201

    # enable / disable colors in the output (reporters and logs)
    colors: true

    # level of logging
    # possible values:
    # LOG_DISABLE ||
    # LOG_ERROR ||
    # LOG_WARN ||
    # LOG_INFO ||
    # LOG_DEBUG
    logLevel: karma.LOG_INFO

    # enable / disable watching file and executing tests whenever any file changes
#    autoWatch: false

    # Start these browsers, currently available:
    # - Chrome
    # - ChromeCanary
    # - Firefox
    # - Opera
    # - Safari (only Mac)
    # - PhantomJS
    # - IE (only Windows)
    browsers: [
      'PhantomJS'
    ]

    # If browser does not capture in given timeout [ms], kill it
    captureTimeout: 5000

    # Continuous Integration mode
    # if true, it capture browsers, run tests and exit
    singleRun: true

    preprocessors:
      '**/*.coffee': ['coffee']

    coffeePreprocessor:
      options:
        bare: true,
        sourceMap: false