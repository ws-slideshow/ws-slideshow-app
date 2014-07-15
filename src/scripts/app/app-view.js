/** @jsx m */
'use strict';

var m = require('mithril'),
  FooterView = require('../footer/footer-view'),
  FooterController = require('../footer/footer-controller'),

  AppView = function (ctrl) {
    return <div>
    AppView
      <p>loading: {ctrl.model.loading()}</p>
      <p>data: {ctrl.model.countValue()}</p>
      <button onclick={ctrl.add.bind(ctrl, 1)}>Add</button>
      <button onclick={ctrl.remove.bind(ctrl, 1)}>Remove</button>
      {FooterView(new FooterController(ctrl.model))}
    </div>;
  };

module.exports = AppView;
