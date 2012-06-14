define [
  'jquery'
  'underscore'
  'backbone'
  'text!templates/infowindows/dmsinfoWindow.html'
], ($, _, Backbone, DmsInfoTemplate) ->
  dmsinfoView = Backbone.View.extend
    tagName: 'div'
    initialize: (@fields) ->

    render: ->
      template = _.template DmsInfoTemplate, fields: @fields
      @$el.html template
      @
