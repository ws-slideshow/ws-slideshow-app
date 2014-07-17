'use strict';

describe('example', function() {

  beforeEach(function() {

  });

  afterEach(function() {

  });

  it('should be equal', function() {
    var a1 = "hello",
      a2 = "hello";
    expect(a1).to.equal(a2);
  });

  it('should not be equal', function() {
    var a = "hello",
      b = "world";
    expect(a).to.not.equal(b);
  });

});
