// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels


// I have no clue what this is - denise 6/26/18
(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);
