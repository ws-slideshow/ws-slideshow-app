class WSSlideshow

  constructor: (@id) ->
    $container = angular.element(document.querySelector("##{@id}"))
    # bootstrap angular
    injector = angular.bootstrap(
      $container,
      ["wsss.app"]
    )
    # return a reference of 'this'
    @