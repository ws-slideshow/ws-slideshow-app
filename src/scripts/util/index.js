module.exports = {
  /**
   * Merges one object into another
   * @param objA {object} Object to merge into
   * @param objB {object} Object to merge from
   * @returns {object}
   */
  mergeObject: function (objA, objB) {
    var prop;
    for (prop in objB) {
      objA[prop] = objB[prop];
    }
    return objA;
  }
}