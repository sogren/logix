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
  #
  find_end_sequence = ->

  # makes move using [x, y] coords, returns changed objects
  move = (coords, blocks) ->
    can_move = (r, c, x, y)->
      return false if map_array[r][c] == 'wl'
      for key of temp_blocks_h
        if temp_blocks_h[key].toString() == [r, c].toString()
          return can_move(r + y, c + x, x, y)
      return true

    moved = 0
    x = coords[0]
    y = coords[1]
    temp_blocks_h = $.extend({}, blocks)

    for key of temp_blocks_h
      r = temp_blocks_h[key][0] + y
      c = temp_blocks_h[key][1] + x
      if can_move(r, c, x, y)
        moved++
        temp_blocks_h[key] = [r, c]

    if moved > 0
      return temp_blocks_h
    else
      return false

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

  # return sum of values for each block
  highest_positions_value = (blocks_h) ->
    h_value = 0
    for key of blocks_h
      x = blocks_h[key][0]
      y = blocks_h[key][1]
      value = values_hash[key][x][y]
      if value > h_value
        h_value = value
    return h_value

  # checks if move is unique or was already done // l - low, h - high
  check_uniqueness = (string, l, h) ->
    if h - l == 1
      if string != u[h] && string != u[l]
        u.splice(h, 0, string)
        return true
      else
        return false

    p = (h+l)/2 | 0
    if string > u[p]
      return check_uniqueness(string, p, h)
    else if string < u[p]
      return check_uniqueness(string, l, p)
    else
      return false

  # makes possible moves without repetitions
  make_all_moves = (blocks_h, move_array) ->
    ff_time1 = Date.now()
    arr = []
    temp_move_arr = []
    directions = [["left", [-1,0]],
                  ["up",   [0,-1]],
                  ["right",[1,0]],
                  ["down", [0,1]]]

    directions.forEach (direction) ->
      temp_move_arr = move_array.slice()
      temp_move_arr.push(direction[0])
      make_move = move(direction[1], blocks_h)
      if make_move
        blocks_s  = JSON.stringify(make_move)
        h = all_unique_combinations.length
        if check_uniqueness(blocks_s, 0, h)
          arr.push([make_move, temp_move_arr])

    ff_time2 = Date.now()
    times2 += (ff_time2 - ff_time1)/1000
    return arr

  # without dummy unique check is breaking
  all_unique_combinations = ['dummy']
  u = all_unique_combinations
  times  = 0
  times2 = 0
  #
  make_move_chunk = (combinations_array, deep_control) ->
    temp_combinations_array = []
    if deep_control
      win = false
      combinations_array.forEach (combination) ->
        if count_position_values(combination[0]) == 0
          win = true
      if win
        return combinations_array
      f_time1 = Date.now()
      combinations_array.forEach (combination) ->
        hash       = combination[0]
        move_array = combination[1]
        value = count_position_values(hash)
        arr   = make_all_moves(hash, move_array)
        arr.forEach (com) ->
          temp_combinations_array.push(com)
      f_time2 = Date.now()
      times += (f_time2 - f_time1)/1000
      console.log "UNIQUE LENGTH : " + all_unique_combinations.length + "\n" +
                  "COMBINATIONS  : " + temp_combinations_array.length + "\n" +
                  "TIME ALL      : " + times.toFixed(3) + "\n" +
                  "TIME SEARCH   : " + times2.toFixed(3) + "\n" +
                  "TIME DIFF     : " + (times-times2).toFixed(3) + "\n" +
                  "TIME RATIO    : " + (times2/times).toFixed(3) + "\n" +

      if times > 1
        deep_control = false
      times = 0
      times2 = 0
      return make_move_chunk(temp_combinations_array, deep_control)
    else
      return combinations_array

  # finds combination closest to win
  find_best_combination = (combinations_array) ->
    best_combination = []
    best_value = 1000
    combinations_array.forEach (combination) ->
      hash = combination[0]
      combination_value = count_position_values(hash)
      if combination_value < best_value
        best_value = combination_value
        best_combination = combination
    return best_combination

  # finds combination closest to win
  find_best_combination2 = (combinations_array) ->
    best_combination = []
    highest_value = 1000
    combinations_array.forEach (combination) ->
      hash = combination[0]
      value = highest_positions_value(hash)
      if value < highest_value
        highest_value = value
        best_combination = combination
    return best_combination

  #
  move_controller = (combinations, i = 0) ->
    console.log '######################'
    console.log 'ITERATION LEVEL: ' + (i+1)
    console.log '######################'

    combinations_array = make_move_chunk(combinations, true)
    best_combination = find_best_combination2(combinations_array)

    value = count_position_values(best_combination[0])
    all_unique_combinations = ['dummy']
    times = 0
    times2 = 0
    u = all_unique_combinations
    h = all_unique_combinations.length
    if value > 0 && i < 10
      move_controller([best_combination], i+1)
    else
      console.log best_combination[0]
      console.log best_combination[1]
      return best_combination[1]


  combinations_array = []
  moves_array = []
  combinations_array.push([hash_blocks, moves_array])

  values_hash = make_values_map_for_each_block(map_array, hash_blocks, hash_homes)
  solution = move_controller(combinations_array)
  console.log solution.length
  make_my_moves(solution)
  console.log("done!")

# recursively makes moves provided in array
window.make_my_moves = (array) ->
  if array.length > 0
    setTimeout (->
      press(array.shift())
      make_my_moves(array)
    ), 50





#   Dla kazdego bloku w koncowym slepym polozeniu sprawdzic sekwencje
# wymagana do homa
# ///
# idac tym tropem moglbym od home sprawdzac kombinacje wymagana do skonczenia
# uwzgledniajac ze gdy home jest otooczyny z 3 stron, to nadal mozna
# wykonywac inne ruchy dowolna ilosc razy, bo to bloku nie wytraci
# moglbym po tym znalezc liste pozycji z ktorych sekwencja moze byc skutecznie
# wykonana i potem tylko szukac jak te pozycje osiagnac
