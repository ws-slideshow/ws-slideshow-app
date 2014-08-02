'use strict';


describe('main', function() {

  var component,
    Main = require('./main');

  beforeEach(function() {
    component = new Main();
  });

  afterEach(function() {
    component = undefined;
  });

  describe('options', function() {

    it('json path has to be defined by default ', function() {
      expect(component.json).to.equal('./slides.json');
    });
  });

  describe('albums', function() {

    it('currentAlbum ', function() {
      expect(component.currentAlbum).to.deep.equal(component.nullAlbum);
    });
  });

});
