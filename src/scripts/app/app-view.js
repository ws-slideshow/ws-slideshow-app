/** @jsx m */
'use strict';

var m = require('mithril'),
  FooterController = require('../footer/footer-controller'),
  FooterView = require('../footer/footer-view'),
  SlidesController = require('../slides/slides-controller'),
  SlidesView = require('../slides/slides-view'),
  PreloaderView = require('../preloader/preloader-view'),
  PreloaderController = require('../preloader/preloader-controller'),

  AppView = function (ctrl) {
    var content = (!!ctrl.model.loading())
      ? renderPreloader(ctrl)
      : renderApp(ctrl);

    return content;
  };

function renderPreloader(ctrl) {
  return <div class="wsss-app-container">
    {PreloaderView(new PreloaderController(ctrl.model))}
  </div>
}

function renderApp(ctrl) {
  return <div class="wsss-app-container">
  {SlidesView(new SlidesController(ctrl.model))}
  {FooterView(new FooterController(ctrl.model))}
  </div>
}

module.exports = AppView;
