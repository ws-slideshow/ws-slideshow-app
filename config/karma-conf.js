module.exports = {

  frameworks: [
    'mocha',
    'chai',
    'sinon',
    'browserify'
  ],

  plugins: [
    'karma-mocha',
    'karma-chai',
    'karma-sinon',
    'karma-browserify',
    'karma-phantomjs-launcher'
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

  browsers: [
    'PhantomJS'
  ],

  captureTimeout: 5000,
  singleRun: true

};
