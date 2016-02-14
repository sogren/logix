


editor = ->
  new_level = ->
    fill_map = (array) ->
      array = new Array(13)
      i = 0
      while i < 13
        k = 0
        array[i] = new Array(13)
        while k < 13
          if i == 0 or i == 12 or k == 0 or k == 12
            array[i][k] = 1
          else
            array[i][k] = 0
          k++
        i++
      return array
    a = []
    render(fill_map(a))
  load_level = (level) ->

  $(document).ready ->
    $("#new-level").click ->
      new_level()
    lvl = 1
    $("#prevlvl").click ->
      if lvl > 1 then lvl-- else lvl = 13
      $("#levelbutton p").text "Level " + lvl
    $("#nextlvl").click ->
      if lvl < 13 then lvl++ else lvl = 1
      $("#levelbutton p").text "Level " + lvl
    $("#levelbutton").click ->
      level = $("#levelbutton p").text().match(/\d+/)[0]
      $.getScript '/levels/' + level
editor()
