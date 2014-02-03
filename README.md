#Still in progress ...

#WS-Slideshow 3

##Build instruction

Make sure that you have all the following tools installed on your machine:

  - [Gulp CLI](http://gulpjs.com)
  - [Bower](http://bower.io)

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

Make sure that you have followed the [build instruction](#build-instruction) above
and [PhantomJS](http://phantomjs.org/) is installed on your machine.


Running unit tests:

    gulp test-unit


Running e2e tests:

    gulp serve
    gulp webdriver
    gulp test-e2e


