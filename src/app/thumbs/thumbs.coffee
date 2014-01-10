angular.module('wsss.thumbs', [
  'wsss.error'
  'wsss.config'
])

# controller
# ------------------------------------------------------------
.controller('ThumbsController',[
    '$scope'
    'ConfigModel'
    'ErrorUtil'
    '$log'
    (
      $scope
      configModel
      errorUtil
      $log
    )->

      init = ->
        $log.info "ThumbsController "
        $scope.$on('configLoaded', =>
          $log.info "LISTEN configLoaded "
          $log.info configModel.data
          $log.info "$scope.hideBar #{$scope.hideBar} "
          $scope.hideBar = configModel.data.preferences.hideBar
          $log.info "$scope.hideBar #{$scope.hideBar} "
        )


      init()
  ]
  )
