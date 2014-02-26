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

    it 'should not has data by default', ->
      expect(@model.hasData()).not.to.be.ok

    it 'should has data', ->
      @model.data = @mockFactory.getJSONData()
      expect(@model.hasData()).to.be.ok

    it 'should not has preferences by default', ->
      expect(@model.getPreferences()).not.to.be.ok

    it 'should has preferences', ->
      @model.data = @mockFactory.getJSONData()
      expect(@model.getPreferences()).to.be.ok

    it 'does not provide an empty currentSlideURL by default', ->
      expect(@model.currentSlideURL()).to.equal ""

    it 'should has a valid currentSlideURL', ->
      jsonData = @mockFactory.getJSONData()
      albumData = jsonData.albums[0]
      @model.data = jsonData
      expect(@model.currentSlideURL()).to.equal "#{albumData.slidePath}#{albumData.slides[0].name}"


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