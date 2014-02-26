describe 'module app: ', ->

  beforeEach module('wsss.app')
  beforeEach module('wsss.test')

  describe 'AppModel', ->
    beforeEach inject (AppModel, MockFactory) ->
      @model = AppModel
      @mockFactory = MockFactory

    afterEach ->
      @model = undefined

    it 'should be injectable', ->
      expect(@model).to.be.ok

    it 'should has not data by default', ->
      expect(@model.hasData()).not.to.be.ok

    it 'should has data', ->
      @model.data = @mockFactory.getJSONData()
      expect(@model.hasData()).to.be.ok

    it 'should has not preferences by default', ->
      expect(@model.getPreferences()).not.to.be.ok

    it 'should has preferences', ->
      @model.data = @mockFactory.getJSONData()
      expect(@model.getPreferences()).to.be.ok


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