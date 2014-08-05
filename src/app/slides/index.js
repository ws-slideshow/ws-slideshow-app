module.exports = {
  id: 'slides',
  template: require('./template.html'),

  data: {

  },

  computed: {
    albumDescription: function() {
      return this.$root.currentAlbum.description || 'no description';
    },

    slideDescription: function() {
      return this.$root.currentSlide.description || 'no description';
    },

    slidePath: function() {
      return this.$root.currentAlbum.slidePath + this.$root.currentSlide.name;
    }
  },

  methods: {

  },


  ready: function () {

  }
}