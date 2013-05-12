# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("form.edit_crush").on("ajax:success", (e, data, status, xhr) ->
    $("form.edit_crush").append "<p>SUCCESS</p>"
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("form.edit_crush").append "<p>ERROR</p>"