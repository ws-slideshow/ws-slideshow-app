#Still in progress ...

#WS-Slideshow 3

##Build instruction

Make sure that you have all the following tools installed on your machine:

  - [Grunt CLI](http://gruntjs.com/)
  - [Bower](bower.io)

Install all npm packages:

    npm install

Install all dependencies:

    bower install

Build dev source:

    gulp

Build release version:

    gulp --release

Open your browser: [127.0.0.1:9001](http://127.0.0.1:9001)

## Tests

Make sure that you have followed the [build instruction](#build-instruction) above.

Also, [PhantomJS](http://phantomjs.org/) has to be installed on your machine.

Last of all there is [an unfixed issue](https://github.com/lazd/gulp-karma/issues/4) using gulp-karma with additional plugins.
To fix it, all needed plugins have NOT to be installed into `{project_folder}/node_modules/` but into
`{project_folder}/node_modules/gulp-karma/node_modules/` as follow:

    cd {project_folder}/node_modules/gulp-karma/node_modules/
    npm install --save-dev karma-mocha
    npm install --save-dev karma-chai
    npm install --save-dev karma-sinon
    npm install --save-dev karma-phantomjs-launcher
    npm install --save-dev karma-coffee-preprocessor


Running unit tests:

    gulp test


