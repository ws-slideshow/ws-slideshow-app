/** @jsx m */
'use strict';

var PreloaderView = function (ctrl) {
  return <p>loading: {ctrl.model.loading()}</p>;
};

module.exports = PreloaderView;
