editor = ->
  load_level = (level) ->

  $(document).ready ->
    lvl = 1
    $("#prevlvl").click ->
      if lvl > 1 then lvl-- else lvl = 13
      $("#levelbutton p").text "Level " + lvl
    $("#nextlvl").click ->
      if lvl < 13 then lvl++ else lvl = 1
      $("#levelbutton p").text "Level " + lvl
    $("#levelbutton").click ->
      level = $("#levelbutton p").text().match(/\d+/)[0]
      $.getScript '/level/' + level
editor()
