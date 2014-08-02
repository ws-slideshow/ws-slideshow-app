module.exports = {

  show: function (message, data) {
    console.error(message);
    if(data){
      console.error(data);
    }
  }
}