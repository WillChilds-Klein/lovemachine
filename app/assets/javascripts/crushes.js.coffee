# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("form[data-remote]").bind("ajax:success", () ->
    console.log "success"
  ).bind("ajax:before", () ->
    console.log "before"
  ).bind "ajax:error", () ->
    console.log "error"