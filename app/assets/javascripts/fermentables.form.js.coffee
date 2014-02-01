class BrewLog.Fermentables.Form
  constructor: (@name) ->

  bindEvents: ->
    $("#fermentable_description").on('change', @updateFields)

  updateFields: ->
    $(".hidable").parents(".control-group").hide()
    description = $("#fermentable_description").val().toLowerCase()
    $(".hidable.#{description}").parents(".control-group").show()

  dispose: ->
    $("#fermentable_description").off('change', @updateFields)
