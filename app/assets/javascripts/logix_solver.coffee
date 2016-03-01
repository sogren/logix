# creates empty array with size of map -> used in creating map of values for blocks
empty_map_array = ->
  array = new Array(13)
  i = 0
  while i < 13
    k = 0
    array[i] = new Array(13)
    i++
  return array

# makes array with position values for block
# position value is number of moves from block's home
make_values_arr = (map_a, home_pos) ->
  # converts undefined to false / just in case
  fill_with_false = (arr) ->
    x = 0
    while x < 13
      y = 0
      while y < 13
        if typeof returned_array[x][y] == "undefined"
          returned_array[x][y] = false
        y++
      x++

  returned_array = empty_map_array()
  position_array = [home_pos]
  temp_arr = []
  value = 0
  while position_array.length > 0
    position_array.forEach (position) ->
      x = position[0]
      y = position[1]
      if typeof returned_array[x][y] == "undefined"
        if map_a[x][y] == "wl"
          returned_array[x][y] = false
        else
          returned_array[x][y] = value
          temp_arr.push([x - 1, y])
          temp_arr.push([x + 1, y])
          temp_arr.push([x, y - 1])
          temp_arr.push([x, y + 1])

    value++
    position_array = $.extend([], temp_arr)
    temp_arr = []

  fill_with_false(returned_array)

  return returned_array


window.solve_level = (map_array, hash_blocks, hash_homes) ->
  # makes move using [x, y] coords, returns changed objects
  move = (coords, blocks) ->
    can_move = (r, c, x, y)->
      return false if map_array[r][c] == 'wl'
      for key of temp_blocks_h
        if temp_blocks_h[key].toString() == [r, c].toString()
          return can_move(r + y, c + x, x, y)
      return true

    x = coords[0]
    y = coords[1]
    temp_blocks_h = $.extend({}, blocks)

    for key of temp_blocks_h
      r = temp_blocks_h[key][0] + y
      c = temp_blocks_h[key][1] + x
      if can_move(r, c, x, y)
        temp_blocks_h[key] = [r, c]

    return temp_blocks_h

  # position value is number of moves from block's home
  make_values_map_for_each_block = (map_a, blocks_h, homes_h) ->
    hash_with_values_arrays = {}
    for key of homes_h
      values_map_for_block = make_values_arr(map_array, homes_h[key])
      hash_with_values_arrays[key] = $.extend([], values_map_for_block)
    return hash_with_values_arrays

  # return sum of values for each block
  count_position_values = (blocks_h) ->
    sum_values = 0
    for key of blocks_h
      x = blocks_h[key][0]
      y = blocks_h[key][1]
      value = values_hash[key][x][y]
      sum_values += value
    return sum_values

  #
  make_all_moves = (blocks_h, move_array) ->
    arr = []
    temp_move_arr = []
    temp_move_arr = move_array.slice()
    temp_move_arr.push("left")
    arr.push([move([-1,0], blocks_h), temp_move_arr])

    temp_move_arr = move_array.slice()
    temp_move_arr.push("up")
    arr.push([move([0,-1], blocks_h), temp_move_arr])

    temp_move_arr = move_array.slice()
    temp_move_arr.push("right")
    arr.push([move([1,0],  blocks_h), temp_move_arr])

    temp_move_arr = move_array.slice()
    temp_move_arr.push("down")
    arr.push([move([0,1],  blocks_h), temp_move_arr])

    return arr

  #
  make_move_chunk = (combinations_array, deep_control) ->
    temp_combinations_array = []
    if deep_control < 9
      combinations_array.forEach (combination) ->
        hash = combination[0]
        value = count_position_values(hash)
        move_array = combination[1]
        temp_combinations_array = temp_combinations_array.concat(make_all_moves(hash, move_array))
      return make_move_chunk(temp_combinations_array, deep_control + 1)
    else
      return combinations_array

  #
  find_best_combination = (combination) ->
    main_array =  make_move_chunk(combination, 0)
    best_combination = []
    best_value = 1000
    main_array.forEach (combination) ->
      hash = combination[0]
      combination_value = count_position_values(hash)
      if combination_value < best_value
        best_value = combination_value
        best_combination = combination
    return best_combination

  #
  move_controller = (combinations, i = 0) ->
    console.log combinations
    combination = find_best_combination(combinations)
    console.log combination
    value = count_position_values(combination[0])
    if value > 0 && i < 3
      console.log "START LOG"
      console.log "END LOG"
      console.log combination
      move_controller([combination], i+1)
    else
     console.log combination[0]
     console.log combination[1]

  combinations_array = []
  unique_positions_array = []

  moves_array = []
  combinations_array.push([hash_blocks, moves_array])
  console.log(combinations_array)

  values_hash = make_values_map_for_each_block(map_array, hash_blocks, hash_homes)
  move_controller(combinations_array)

  console.log("done!")
