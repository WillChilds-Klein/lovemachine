# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

success = ->
  console.log "done"
  window.location.href = "/"

before = ->
  $(".form-wrapper").hide()
  $(".loading-wrapper").show()
  $(".infinity-spinner").addClass "spin"

$ ->
  $("form[data-remote]").bind("ajax:success", () ->
    do success
  ).bind("ajax:before", () ->
    do before
  ).bind "ajax:error", () ->
    console.log "error"
  $(".question").tooltip placement: 'right'