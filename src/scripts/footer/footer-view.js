/** @jsx m */
'use strict';

var FooterView = function (ctrl) {
  return <div>
  Footer
    <button onclick={ctrl.add.bind(ctrl, 1)}>Add</button>
  </div>;
};

module.exports = FooterView;
//    <p>current slide: {ctrl.currentSlideID()}</p>
//    <p>testValue: {ctrl.appModel.testValue()}</p>
