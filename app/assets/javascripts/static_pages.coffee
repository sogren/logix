# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
imgnum = 1
img = 'image'

$(document).ready ->
  $("#next").click ->
    $("#" + img + imgnum).stop().animate opacity: 0
    if imgnum !=3 then (imgnum += 1) else (imgnum = 1)
    $("#" + img + imgnum).stop().animate opacity: 1
  $("#previous").click ->
    $("#" + img + imgnum).stop().animate opacity: 0
    if imgnum !=1 then (imgnum -= 1) else (imgnum = 3)
    $("#" + img + imgnum).stop().animate opacity: 1
  $("#next").click ->
    $("#" + img + imgnum).stop().animate opacity: 0
    if imgnum !=3 then (imgnum += 1) else (imgnum = 1)
    $("#" + img + imgnum).stop().animate opacity: 1
  setInterval (->
    $("#" + img + imgnum).stop().animate opacity: 0
    imgnum += 1
    if imgnum > 3
      imgnum = 1
    $("#" + img + imgnum).stop().animate opacity: 1
  ), 3000
  return
