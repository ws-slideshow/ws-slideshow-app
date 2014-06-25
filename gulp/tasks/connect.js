var gulp = require('gulp'),
  serveStatic = require('serve-static'),
  serveIndex = require('serve-index'),
  config = require('../config');

gulp.task('connect', function () {
  var connect = require('connect');
  var app = connect()
    .use(require('connect-livereload')({ port: 35729 }))
    .use(serveStatic(config.src))
    .use(serveStatic(config.tmp))
    .use(serveStatic(config.assets))
    .use(serveIndex(config.src));

  require('http').createServer(app)
    .listen(config.port)
    .on('listening', function () {
      console.log('Started connect web server on ' + config.url + ':' + config.port);
    });
});