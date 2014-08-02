'use strict';


describe('main -> ', function() {

  var component,
    Main = require('./main'),
    mockFactory = require('../helper/mock-factory');

  beforeEach(function() {
    component = new Main();
  });

  afterEach(function() {
    component = undefined;
  });

  describe('data -> ', function() {
    it('json path has to be defined by default ', function() {
      expect(component.json).to.equal('./slides.json');
    });
  });

  describe('albums -> ', function() {

    it('currentAlbum has to be nullAlbum before setting data', function() {
      expect(component.currentAlbum).to.deep.equal(component.nullAlbum);
    });

    it('currentAlbum has to be the first after setting data', function() {
      var mockAlbums = mockFactory.createAlbums(2, 3);
      component.albums = mockAlbums;
      expect(component.currentAlbum).to.deep.equal(mockAlbums[0]);
    });
  });

});
