module.exports = {
  id: 'footer',
  template: require('./template.html'),

  data: {
    label: 'I am footer!'
  },

  ready: function () {
    console.log("FOOTER countValue " + this.$root.countValue);
  },

  methods: {
    clickHandler: function(){
      console.log("click");
      this.$root.countValue += 1;
      console.log("FOOTER CLICK countValue " + this.$root.countValue);
    }
  }
}