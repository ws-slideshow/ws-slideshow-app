var angular = require('angular');

WSSlideshow = (function () {
  function WSSlideshow(id) {
    var $container, injector;
    this.id = id;
    $container = angular.element(document.querySelector("#" + this.id));
    injector = angular.bootstrap($container, ["wsss.app"]);
  }

  return WSSlideshow;

})();

module.exports = WSSlideshow;