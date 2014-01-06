WSSlideshow = WSSlideshow or {}
WSSlideshow.init = (args)->
  $container = $("##{args.id}")
  # adding appController 'by hand'
  $container.attr 'ng-controller', 'AppController'
  # bootstrap angular
  angular.bootstrap(
    $container,
    ["wsss.app"]
  )