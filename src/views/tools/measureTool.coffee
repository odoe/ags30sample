# With require.sj, I used to be able to load
# html files as strings by using the text plugin.
# Dojo 1.7 has a text module as well and should work
# exactly as the require.js plugin
# 'text!templates/MeasureTool.html'
# you just need to make it dojo/text!
# i tried to create an alias for this,
# but didn't work
define [
  'jquery'
  'underscore'
  'backbone'
  'dojo/text!templates/MeasureTool.html'
  # You can load extra libraries, like jquery without passing them
  # in the callback. For example, jqueryui returns/modifies $ to
  # add ui functionality. So add it to
  # end of array list.
  'jqueryui'
], ($, _, Backbone, MeasureTemplate) ->
  MeasureView = Backbone.View.extend
    tagName: "div"
    id: 'measure'
    initialize: (@eventManager) ->

    render: (@map) ->
      content = _.template MeasureTemplate, ""
      @$el.html content

      @eventManager.bind "initMeasure", =>
        measurement = new esri.dijit.Measurement {map: @map}, dojo.byId "measurementDiv"
        measurement.startup()
        $("#measure").accordion collapsible: true, active: false
      @
