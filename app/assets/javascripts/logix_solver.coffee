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




# makes move using [x, y] coords, returns changed objects
make_move = (coords, map_a, blocks) ->
  can_move = (r, c, x, y)->
    return false if map_a[r][c] == 'wl'
    for key of blocks_h
      if blocks_h[key].toString() == [r, c].toString()
        return can_move(r + y, c + x, x, y)
    return true

  blocks_h = $.extend([], blocks_h)

  for key of blocks_h
    r = blocks_h[key][0] + y
    c = blocks_h[key][1] + x
    if can_move(r, c, x, y)
      blocks_h[key] = [r, c]

  return blocks_h

window.solve_level = (map_array, hash_blocks, hash_homes) ->
  make_all_moves = ->
    move([-1,0], map_a, blocks_h)
    move([0,-1], map_a, blocks_h)
    move([1,0], map_a, blocks_h)
    move([0,1], map_a, blocks_h)
  brute_force_until_block_in_home = (map_a, blocks_h, homes_h) ->
    hash_with_values_arrays = {}

    for key of blocks_h
      values_map_for_block = empty_map_array()
      values_map_for_block = make_values_arr(map_array, blocks_h[key])
      hash_with_values_arrays[key] = $.extend([], values_map_for_block)
    console.log(hash_with_values_arrays)


  map_positions_values = (map_a, blocks_h, homes_h) ->

  check_moves = (map_a, blocks_h, homes_h) ->

  brute_force_until_block_in_home(map_array, hash_blocks, hash_homes)
  console.log("done!")
