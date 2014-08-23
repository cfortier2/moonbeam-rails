//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//
//= require_self
//
//= require ./app

window.App = Ember.Application.create({
  LOG_TRANSITIONS: true,
  LOG_TRANSITIONS_INTERNAL: true,
  LOG_VIEW_LOOKUPS: true
});

