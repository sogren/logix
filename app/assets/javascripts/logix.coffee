main = ->
  dir = ''
  #
  document.onkeydown = (e) ->
    switch e.keyCode
      when 37
        dir = 'left'
        move(-1,0)
      when 38
        dir = 'up'
        move(0,-1)
      when 39
        dir = 'right'
        move(1,0)
      when 40
        dir = 'down'
        move(0,1)
    return
  #
  move = (x, y) ->
    # recursively checks if block can move to neighbouring tile
    can_move = (r, c, x, y)->
      return false if map_array[r][c] == 1
      for key of hash_blocks
        if hash_blocks[key].toString() == [r, c].toString()
          return can_move(r + y, c + x, x, y)
      return true
    blocks = Object.keys(hash_blocks)
    q = 0
    while q < blocks.length
      r = hash_blocks[blocks[q]][0] + y
      c = hash_blocks[blocks[q]][1] + x
      if can_move(r, c, x, y)
        hash_blocks[blocks[q]] = [r, c]
      q++

    $(document).ready ->
      class_arr = convert(map_array, hash_blocks, hash_homes)
      create(class_arr)

  # converts map array and homes hash to map of class names / used in displaying map
  convert = (arr_blocks, hash_blocks, hash_homes) ->
    # returns class names from block name
    class_names = (value) ->
      switch value
        when 0 then return 'square'
        when 1 then return 'wall'
    #
    # checks if there is block on given position, returns its name
    block_presence = (value) ->
      for key of hash_blocks
        if hash_blocks[key].toString() == value.toString()
          return key
      return false
    #
    arr_classes = new Array(13)

    i = 0
    while i < 13
      k = 0
      arr_classes[i] = new Array(13)
      while k < 13
        arr_classes[i][k] = class_names(arr_blocks[i][k])
        k++
      i++

    for key of hash_blocks
      i = hash_blocks[key][0]
      k = hash_blocks[key][1]

      arr_classes[i][k] = 's' + key + 'b'

    for key of hash_homes
      i = hash_homes[key][0]
      k = hash_homes[key][1]

      if !block_presence([i, k])
        arr_classes[i][k] = 's' + key + 'h'
      else if block_presence([i, k]) == key
        arr_classes[i][k] = 's' + key + 'i'
      else
        arr_classes[i][k] = arr_classes[i][k] + ' w' + key

    return arr_classes
  # fill array with basic map values
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
  # displays map using array with class names
  create = (arr) ->
    $('#container').empty()
    moves = 0
    $('#counter span').text moves
    r = 0
    while r < 13
      c = 0
      while c < 13
        $div = $('<div>', class: arr[r][c])
        $('#container').append $div
        c++
      r++
  #
  map_array = fill_map(map_array)
  map_array[6][6] = 1
  hash_homes  = { 'r': [5, 8], 'g': [11, 3], 'b': [8, 3] }
  hash_blocks = { 'r': [5, 8], 'g': [11, 2], 'b': [1, 7], 'y': [8, 3], 't': [5, 2], 'v': [2, 3] }

  class_arr = convert(map_array, hash_blocks, hash_homes)

  $(document).ready ->
    create(class_arr)
#####################
main()


