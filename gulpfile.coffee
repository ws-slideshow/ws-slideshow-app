pkg = require './package.json'
gulp = require 'gulp'
gutil = require 'gulp-util'
clean = require 'gulp-clean'
coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
sass = require 'gulp-ruby-sass'
minifyCSS = require 'gulp-minify-css'
replace = require 'gulp-replace'
processhtml = require 'gulp-processhtml'
refresh = require 'gulp-livereload'
lr = require 'tiny-lr'
server = lr()
connect = require 'connect'
karma = require 'gulp-karma'

runRelease = gulp.env.release

pathes =
  src: './src'
  dist: './dist'
  vendor: './vendor'
  test: './test'
  assets: './assets'


# clean
# ------------------------------------------------------------
gulp.task('clean', ->
  gulp.src("#{pathes.dist}/**/*.*",
    read: false
  )
  .pipe(clean())
)

# js app
# ------------------------------------------------------------
gulp.task('js', ->
  gulp.src([
    "#{pathes.src}/common/**/**.coffee",
    "#{pathes.src}/app/slides/**/**.coffee",
    "#{pathes.src}/app/thumbs/**/**.coffee",
    "#{pathes.src}/app/config/**/**.coffee",
    "#{pathes.src}/app/app.coffee",
    "#{pathes.src}/app/#{pkg.name}.coffee"
  ])
  .pipe(coffeelint())
  .pipe(coffeelint.reporter())
  .pipe(coffee(
    bare: true
    join: true
  ))
  .pipe(concat("ws-slideshow.js"))
  .pipe(
    if runRelease then uglify() else gutil.noop()
  )
  .pipe(gulp.dest(
    "#{pathes.dist}/js"
  ))
  .pipe(
    refresh(server)
  )
)

# js lib
# ------------------------------------------------------------
gulp.task('js-lib', ->
  gulp.src([
    "#{pathes.vendor}/angular/angular.js"
    "#{pathes.vendor}/angular-animate/angular-animate.js"
    "#{pathes.vendor}/angular-resource/angular-resource.js"
    "#{pathes.vendor}/angular-route/angular-route.js"
    "#{pathes.vendor}/angular-touch/angular-touch.js"
    "#{pathes.vendor}/Snap.svg/dist/snap.svg.js"
  ])
  .pipe(concat("ws-slideshow.lib.js"))
  .pipe(
      if runRelease then uglify() else gutil.noop()
    )
  .pipe(gulp.dest(
      "#{pathes.dist}/js"
    ))
)



# styles
# ------------------------------------------------------------
gulp.task('styles', ->
  gulp.src(
    "#{pathes.src}/sass/#{pkg.name}.scss"
  )
  .pipe(sass(
    unixNewlines: true
#    sourcemap: !runRelease
    lineNumbers: !runRelease
    debugInfo: !runRelease
  ))
  .pipe(
    if runRelease then minifyCSS() else gutil.noop()
  )
  .pipe(gulp.dest(
    "#{pathes.dist}/styles"
  ))
  .pipe(
    refresh(server)
  )
)

# assets
# ------------------------------------------------------------
gulp.task('assets', ->
  gulp.src(
    "#{pathes.assets}/**"
  )
  .pipe(gulp.dest(
    "#{pathes.dist}/assets"
  ))
)

# livereload
# ------------------------------------------------------------
gulp.task('lr-server', ->
  unless runRelease
    server.listen(35729, (err)->
      if (err)
        return console.log(err)
    )
)
# HTML
# ------------------------------------------------------------
gulp.task('html', ->
  gulp.src(
    "#{pathes.src}/app/index.html"
  )
  .pipe(replace(/__version__/g, pkg.version))
  .pipe(
    if runRelease
    then processhtml(
      'index.html'
    )
    else gutil.noop()
  )
  .pipe(gulp.dest(
      "#{pathes.dist}/"
    ))
)

# server
# ------------------------------------------------------------
gulp.task('serve', ->
  connect()
  .use(connect.static(pathes.dist))
  .listen 9001
)

# karma
# ------------------------------------------------------------
gulp.task('karma', ->
  testFiles = [
    "#{pathes.dist}/js/ws-slideshow.lib.js"
    "#{pathes.dist}/js/ws-slideshow.js"
    "#{pathes.vendor}/angular-mocks/angular-mocks.js"
    "#{pathes.test}/mockFactory.coffee"
    "#{pathes.test}/unit/**/*.coffee"
  ]

  gulp.src(
    testFiles
  )
  .pipe(karma(
    configFile: "#{pathes.test}/karma.conf.coffee"
    action: 'run'
  ))
)

# test
# ------------------------------------------------------------
gulp.task('test', ['js'], ->
  gulp.run(
    'karma'
  )

  gulp.watch([
    "#{pathes.src}/**/**.coffee"
    "#{pathes.test}/**/**.coffee"
    ], ->
      gulp.run(
        'karma'
      )
  )
)

# default
# ------------------------------------------------------------
gulp.task('default', ['clean'], ->
  gulp.run(
    'assets'
    'js'
    'js-lib'
    'styles'
    'html'
    'lr-server'
    'serve'
  )

  # watching in debug mode only
  unless runRelease
    gulp.watch("#{pathes.src}/**/**.coffee", ->
      gulp.run(
        'js'
      )
    )

    gulp.watch("#{pathes.vendor}/**/**.js", ->
      gulp.run(
        'js-lib'
      )
    )

    gulp.watch("#{pathes.src}/sass/**/**.scss", ->
      gulp.run(
        'styles'
      )
    )

    gulp.watch("#{pathes.src}/app/**/**.html", ->
      gulp.run(
        'html'
      )
    )
)