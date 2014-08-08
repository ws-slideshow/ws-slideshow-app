describe('App', function() {


  var App = require('./App'),
    app;

  beforeEach(function() {
    app = new App();
  });

  afterEach(function() {
    app = undefined;
  });

  it('module should be loaded', function() {
    expect(app).to.exist
  });


});
