module.exports = {
  id: 'nav',
  template: require('./template.html'),

  data: {
    labelNext: ">",
    labelPrev: "<"
  },

  methods: {
    prev: function(){
      this.$root.prevSlide();
    },
    next: function(){
      this.$root.nextSlide();
    }
  }
}