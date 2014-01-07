describe 'app', ->

  beforeEach module('wsss.app')

  describe 'AppController', ->

    beforeEach inject ($rootScope, $controller) ->
      @scope = $rootScope.$new()
      @controller = $controller "AppController",
                      $scope: @scope

    afterEach ->
      @scope =
      @controller =
      undefined


    it 'is injectable', ->
      expect(@controller).to.be.ok