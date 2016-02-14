editor = ->
  # sets mouse click event and returns xy number of clicked rect
  get_clicked = ->
    mouse_click = (e) ->
      e.preventDefault()
      e.stopPropagation()
      mx = e.clientX - offsetX
      my = e.clientY - offsetY
      x = Math.ceil(mx/30)
      y = Math.ceil(my/30)
      console.log(x)
      console.log(y)
    c_bound = canvas.getBoundingClientRect()
    offsetX = c_bound.left
    offsetY = c_bound.top
    canvas.addEventListener("mousedown",mouse_click, false)
  #
  #
  new_level = ->
  # makes new level with only basic map layout
    initial_map = (array) ->
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
    #
    map_arr = initial_map([])
    hash_blocks = {}
    hash_homes = {}
    x = 0
    y = 0

    render(map_arr, hash_blocks, hash_homes)
    get_clicked()
    console.log(x)
    console.log(y)

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
