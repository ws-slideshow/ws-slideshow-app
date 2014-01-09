angular.module('wsss.slides', [
  'wsss.error'
  'wsss.config'
])

# controller
# ------------------------------------------------------------
.controller('SlidesController',[
    'ConfigModel'
    'ErrorUtil'
    '$log'
    (
      configModel
      errorUtil
      $log
    )->

      init = ->
        $log.info "SlidesController "

      init()
  ]
)
