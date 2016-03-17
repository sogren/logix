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
  # support funciton to remove block duplication
  remove_others_from_hash = (hash, coords) ->
    for key, value of hash
      if String(value) == String(coords)
        delete hash[key]
  # place wall on map
  wall_validator = (type, coords) ->
    remove_others_from_hash(hash_blocks, coords)
    remove_others_from_hash(hash_homes, coords)
    map_arr[coords[0]][coords[1]] = type
  # place block or home on map
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
  # binds event to mouse click - gives the possibility to edit map
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

  #
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
    h = JSON.stringify(hash_homes)
    b = JSON.stringify(hash_blocks)
    m = JSON.stringify(map_arr)
    $.post 'levels', {
      hash_homes: h
      hash_blocks: b
      map_arr: m
    }
    hash_blocks_string = 'hash_blocks =  ' + JSON.stringify(hash_blocks)
    hash_blocks_string = hash_blocks_string.replace(/['"]+/g,'')
    hash_homes_string = 'hash_homes =  ' + JSON.stringify(hash_homes)
    hash_homes_string = hash_homes_string.replace(/['"]+/g,'')
    console.log hash_blocks_string + "\n" +
                hash_homes_string + "\n" +
                'map_arr = ' + JSON.stringify(map_arr) + "\n" +
                "type = 'Novice'" + "\n" +
                "make_level(hash_blocks, hash_homes, map_arr, type)"

    #solve_level(map_arr, hash_blocks, hash_homes)
    #main(hash_blocks, hash_homes, map_arr)
