/** @jsx React.DOM */
var React = require('react'),

  App = React.createClass({
    render: function () {
      return <div className="container content">
      Hello {this.props.elementId}, json source {this.props.json}
      </div>;
    }
  });

module.exports = App;
