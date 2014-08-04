module.exports = {

  createAlbumsPreferences: function () {
    return {
      loop: false
    }
  },

  createAlbums: function (noAlbums, noSlides) {
    var i = 0,
      max = noAlbums || 1,
      maxSlides = noSlides || Math.round(Math.random() * 10) + 1,
      albums = [];

    for (i; i < max; i++) {
      albums[i] = this.createAlbum(i, maxSlides);
    }

    return albums;
  },


  createAlbum: function (id, noSlides) {
    var maxSlides = noSlides || Math.round(Math.random() * 10) + 1;

    return {
      slidePath: 'slides/album' + id + '/',
      thumbsPath: 'thumbs/album' + id + '/',
      description: "album description " + id,
      slides: this.createSlides(maxSlides)
    }
  },

  createSlides: function (noSlides) {
    var i = 0,
      max = noSlides || 1,
      slides = [];

    for (i; i < max; i++) {
      slides[i] = this.createSlide(i);
    }

    return slides;
  },

  createSlide: function (id) {
    return {
      name: id + '.jpg',
      thumbName: 'thumb_' + id + '18.jpg',
      description: "slide description " + id
    }
  }

}