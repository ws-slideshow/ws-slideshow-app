'use strict';


describe('main -> ', function () {

  var component,
    Main = require('./main'),
    mockFactory = require('../helper/mock-factory');

  beforeEach(function () {
    component = new Main();
  });

  afterEach(function () {
    component = undefined;
  });

  describe('data -> ', function () {
    it('json path has to be defined by default ', function () {
      expect(component.json).to.equal('./slides.json');
    });
  });

  describe('albums -> ', function () {

    // current album
    // ------------------------------------------------------------

    it('currentAlbum has to be nullAlbum before setting data', function () {
      expect(component.currentAlbum).to.deep.equal(component.nullAlbum);
    });

    it('currentAlbum has to be the first after setting data', function () {
      var mockAlbums = mockFactory.createAlbums(2);
      component.albums = mockAlbums;
      expect(component.currentAlbum).to.deep.equal(mockAlbums[0]);
    });

    // album index
    // ------------------------------------------------------------

    it('count albumIndex forward to NEXT album', function () {
      component.albums = mockFactory.createAlbums(2);
      component.nextAlbum();
      expect(component.albumIndex).to.be.equal(1);
    });

    it('count albumIndex forward to LAST album (and not more)', function () {
      var mockAlbums = mockFactory.createAlbums(3);
      component.albums = mockAlbums;
      component.nextAlbum(); // 2. album
      component.nextAlbum(); // 3. album
      component.nextAlbum(); // 4. album -> not exists
      expect(component.albumIndex).to.be.equal(2);
    });

    it('LOOP albumIndex forward', function () {
      component.albums = mockFactory.createAlbums(3);
      component.albumsPreferences = mockFactory.createAlbumsPreferences();
      component.albumsPreferences.loop = true;
      component.nextAlbum(); // 2. album
      component.nextAlbum(); // 3. album
      component.nextAlbum(); // 1. album
      component.nextAlbum(); // 2. album
      expect(component.albumIndex).to.be.equal(1);
    });

    it('count albumIndex back to PREVIOUS album', function () {
      component.albums = mockFactory.createAlbums(3);
      component.albumIndex = 2; // last album == 3. album
      component.prevAlbum(); // 2. album
      expect(component.albumIndex).to.be.equal(1);
    });

    it('count albumIndex back to FIRST album (and not more)', function () {
      var mockAlbums = mockFactory.createAlbums(3);
      component.albums = mockAlbums;
      component.albumIndex = 2; // last album == 3. album
      component.prevAlbum(); // 2. album
      component.prevAlbum(); // 1. album
      component.prevAlbum(); // 0 album -> not exists
      expect(component.albumIndex).to.be.equal(0);
    });

    it('LOOP albumIndex backwards', function () {
      component.albums = mockFactory.createAlbums(3);
      component.albumsPreferences = mockFactory.createAlbumsPreferences();
      component.albumsPreferences.loop = true;
      component.prevAlbum(); // 3. album
      expect(component.albumIndex).to.be.equal(2);
    });


    // next album
    // ------------------------------------------------------------

    it('has not a next album by default', function () {
      expect(component.hasNextAlbum).to.not.be.ok;
    });

    it('has next album', function () {
      component.albums = mockFactory.createAlbums(2);
      expect(component.hasNextAlbum).to.be.ok;
    });

    it('LAST album has not a next album', function () {
      component.albums = mockFactory.createAlbums(2);
      component.albumIndex = 1;
      expect(component.hasNextAlbum).to.not.be.ok;
    });

    it('LAST album has a next album if loop is enabled', function () {
      component.albums = mockFactory.createAlbums(2);
      component.albumsPreferences = mockFactory.createAlbumsPreferences();
      component.albumsPreferences.loop = true;
      component.albumIndex = 1;
      expect(component.hasNextAlbum).to.be.ok;
    });

    // previous album
    // ------------------------------------------------------------

    it('has not a previous album by default', function () {
      expect(component.hasPrevAlbum).to.not.be.ok;
    });

    it('has a previous album', function () {
      component.albums = mockFactory.createAlbums(2);
      component.albumIndex = 1;
      expect(component.hasPrevAlbum).to.be.ok;
    });

    it('FIRST album has not a previous album', function () {
      component.albums = mockFactory.createAlbums(2);
      expect(component.hasPrevAlbum).to.not.be.ok;
    });

    it('FIRST album has a previous album if loop is enabled', function () {
      component.albums = mockFactory.createAlbums(2);
      component.albumsPreferences = mockFactory.createAlbumsPreferences();
      component.albumsPreferences.loop = true;
      expect(component.hasPrevAlbum).to.be.ok;
    });


  });

  describe('slides -> ', function () {

    // current slide
    // ------------------------------------------------------------

    it('current slide has to be nullSlide before setting data', function () {
      expect(component.currentSlide).to.deep.equal(component.nullSlide);
    });

    // next slide
    // ------------------------------------------------------------

    it('has next slide', function () {
      component.albums = mockFactory.createAlbums(2, 2);
      expect(component.hasNextSlide).to.be.ok;
    });


    it('LAST slide has not a next slide', function () {
      component.albums = mockFactory.createAlbums(2, 2);
      component.slideIndex = 1;
      expect(component.hasNextSlide).to.not.be.ok;
    });

    it('LAST slide has a next slide if loop of ALL albums is enabled', function () {
      component.albums = mockFactory.createAlbums(2, 2);
      // set loop
      component.currentAlbum.loop = true;
      // set to last slide index
      component.slideIndex = 1;
      expect(component.hasNextSlide).to.be.ok;
    });

    it('LAST slide has a next slide if loop of its album is enabled', function () {
      component.albums = mockFactory.createAlbums(2, 2);
      component.albumsPreferences = mockFactory.createAlbumsPreferences();
      // set loop
      component.albumsPreferences.loop = true;
      // set to last slide index
      component.slideIndex = 1;
      expect(component.hasNextSlide).to.be.ok;
    });

    // prev. slide
    // ------------------------------------------------------------

    it('has a previous slide', function () {
      component.albums = mockFactory.createAlbums(2, 2);
      // set to last index
      component.slideIndex = 1;
      expect(component.hasPrevSlide).to.be.ok;
    });

    it('FIRST slide has not a previous slide', function () {
      component.albums = mockFactory.createAlbums(2, 2);
      expect(component.hasPrevSlide).to.not.be.ok;
    });

    it('FIRST slide has a previous album if loop of ALL albums is enabled', function () {
      component.albums = mockFactory.createAlbums(2, 2);
      // set loop
      component.albumsPreferences = mockFactory.createAlbumsPreferences();
      component.albumsPreferences.loop = true;
      expect(component.hasPrevSlide).to.be.ok;
    });

    it('FIRST slide has a previous album if loop of its album is enabled', function () {
      component.albums = mockFactory.createAlbums(2, 2);
      // set loop
      component.currentAlbum.loop = true;
      expect(component.hasPrevSlide).to.be.ok;
    });

  })

});
