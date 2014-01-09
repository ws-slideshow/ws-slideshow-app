angular.module('wsss.thumbs', [
  'wsss.error'
  'wsss.config'
])

# controller
# ------------------------------------------------------------
.controller('ThumbsController',[
    'ConfigModel'
    'ErrorUtil'
    '$log'
    (
      configModel
      errorUtil
      $log
    )->

      init = ->
        $log.info "ThumbsController "

      init()
  ]
  )
