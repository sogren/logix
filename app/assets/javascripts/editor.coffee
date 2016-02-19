window.new_level = ->
# makes new level with only basic map layout
  window.initial_map = (array) ->
    array = new Array(13)
    i = 0
    while i < 13
      k = 0
      array[i] = new Array(13)
      while k < 13
        if i == 0 or i == 12 or k == 0 or k == 12
          array[i][k] = "wl"
        else
          array[i][k] = "sq"
        k++
      i++
    return array
  #
  map_arr = initial_map([])
  render(map_arr, {}, {})
window.editor = ->
  remove_others_from_hash = (hash, coords) ->
    for key, value of hash
      if String(value) == String(coords)
        delete hash[key]

  wall_validator = (type, coords) ->
    remove_others_from_hash(hash_blocks, coords)
    remove_others_from_hash(hash_homes, coords)
    map_arr[coords[0]][coords[1]] = type

  validator = (hash, type, coords) ->
    if hash[type] == coords
      delete hash[type]
    else
      remove_others_from_hash(hash, coords)
      hash[type] = coords
      map_arr[coords[0]][coords[1]] = "sq"

  # sets mouse click event and returns xy number of clicked rect
  between = (num, range) ->
    return true if num > range[0] && num < range[1]
    return false
  set_event = ->
    mouse_click = (e) ->
      e.preventDefault()
      e.stopPropagation()
      mx = e.clientX - offsetX
      my = e.clientY - offsetY
      x = Math.floor(mx/30)
      y = Math.floor(my/30)

      if chosen_rect && between(x, [0,12]) && between(y, [0,12])
        clr = chosen_rect[0]
        type = chosen_rect[1]
        switch type
          when "b"
            validator(hash_blocks, clr, [y, x])
          when "h"
            validator(hash_homes, clr, [y, x])
          else
            wall_validator(chosen_rect, [y, x])
        if validator
          render(map_arr, hash_blocks, hash_homes)

    c_bound = canvas.getBoundingClientRect()
    offsetX = c_bound.left
    offsetY = c_bound.top
    canvas.addEventListener("mousedown",mouse_click, false)
  #
  set_event()
  map_arr = initial_map([])
  hash_blocks = {}
  hash_homes = {}
  chosen_rect = ""

  $("#walls > div").click ->
    wall = $(this).text()[0]
    if wall == "w" then wall = "wl" else wall = "sq"
    chosen_rect = wall
  $("#blocks > div").click ->
    block = $(this).text()[0] + "b"
    chosen_rect = block
  $("#homes > div").click ->
    home = $(this).text()[0] + "h"
    chosen_rect = home

  $("#new-level").click ->
    console.log(hash_homes)
    console.log(hash_blocks)
    console.log(map_arr)
    console.log(JSON.stringify(hash_homes))
    console.log(JSON.stringify(hash_blocks))
    console.log(JSON.stringify(map_arr))
    h = JSON.stringify(hash_homes)
    b = JSON.stringify(hash_blocks)
    m = JSON.stringify(map_arr)
    $.post 'levels', {
      hash_homes: h
      hash_blocks: b
      map_arr: m
    }
