describe "ws homepage", ->
  ptor = protractor.getInstance()
  beforeEach ->

  it "check title", ->
    ptor.get '/index.html'
    title = ptor.getTitle()

    expect(title).toBe "WS-Slideshow"