module.exports = {

  frameworks: [
    'mocha',
    'chai',
    'sinon',
    'browserify'
  ],

  exclude: [],

  reporters: [
    'progress',
    'dots'
  ],

  port: 9878,
  runnerPort: 9201,

  colors: true,
  logLevel: "INFO", // karma.LOG_INFO,

  preprocessors: {
    "/**/*.browserify": 'browserify'
  },

  // Files to browserify
  browserify: {
    transform: [
      'debowerify',
      'deamdify'
    ],
    files: [
      'src/vendor/famous-polyfills/index.js',
      'src/app/**/*.js',
      'src/app/**/*.spec.js'
    ]
  },

  browsers: [
    'PhantomJS'
  ],

  captureTimeout: 60000,
  singleRun: true

};
