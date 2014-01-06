# module definition
# ------------------------------------------------------------
angular.module('wsss.app', [
])

# controller
# ------------------------------------------------------------
.controller 'AppController',[
  '$log',
  ($log)->

    init = ->
      $log.info("app #{Math.random()} ")


    init()
]