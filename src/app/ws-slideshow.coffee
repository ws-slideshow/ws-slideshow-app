class WSSlideshow

  constructor: (@id) ->
    $container = angular.element(document.querySelector("##{@id}"))
    # adding appController 'by hand'
#    $container.attr 'ng-controller', 'AppController'
    # bootstrap angular
    injector = angular.bootstrap(
      $container,
      ["wsss.app"]
    )
    @