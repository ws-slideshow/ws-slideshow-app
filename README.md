#Still in progress ...

#WS-Slideshow 3


##Build instruction

Make sure all of the following tools have been installed on your machine:

  - [Gulp CLI](http://gulpjs.com)
  - [Bower](http://bower.io)

Install npm packages:

    npm install

Install dependencies:

    bower install

Run local version:

    gulp watch

Your browser will be opened with [127.0.0.1:9001](http://127.0.0.1:9001)

Build release version:

    gulp build


## Tests

Make sure that you have followed the [build instruction](#build-instruction) above
and [PhantomJS](http://phantomjs.org/) is installed on your machine.


Running unit tests:

    gulp test-unit


Running e2e tests:

    gulp serve
    gulp webdriver
    gulp test-e2e

