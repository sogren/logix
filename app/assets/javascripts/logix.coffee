# display map with canvas cuz html is inefficient
hey_ho_canvas = (arr) ->
  # return color depending on tile type / temporary i hope cuz its ugly as hell
  color_from_cls = (cls) ->
    bright = { 'b': 'F', 'h': 'A', 'i': '6'}
    b = bright[cls[1]]
    switch cls[0]
      when 'r' then return '#' + b + '0' + '0'
      when 'b' then return '#' + '0' +'0'+ b
      when 'g' then return '#' + '0' + b + '0'
      when 't' then return '#' + '0' + b + b
      when 'y' then return '#' + b + b + '0'
      when 'v' then return '#' + b + '0' + b

  canvas = document.getElementById('canvas')
  c = canvas.getContext('2d')
  c.fillStyle = '#BBB'
  c.fillRect(0, 0, 390, 390)
  # size of rect,
  s = 26

  row = 0
  while row < 13
    column = 0
    while column < 13
      # coords of rect, +2 is for border
      x = 30*column + 2
      y = 30*row + 2
      tile_cls = arr[row][column]

      if tile_cls == 'sq'
        color = '#666'
      else if tile_cls == 'wl'
        color = '#FFF'
      else
        color = color_from_cls(tile_cls)

      c.fillStyle = color
      c.fillRect(x, y, s, s)

      if tile_cls.length > 2
        c.lineWidth = 4
        c.strokeStyle = color_from_cls(tile_cls.slice(2))
        c.strokeRect(x, y, s, s)

      column++
    row++

####################################################################################
####################################################################################
main = ->
  #
  document.onkeydown = (e) ->
    switch e.keyCode
      when 37
        move(-1,0)
      when 38
        move(0,-1)
      when 39
        move(1,0)
      when 40
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
      hey_ho_canvas(class_arr)

  # converts map array and homes hash to map of class names / used in displaying map
  convert = (arr_blocks, hash_blocks, hash_homes) ->
    # returns class names from block name
    class_names = (value) ->
      switch value
        when 0 then return 'sq'
        when 1 then return 'wl'
    # checks if there is block on given position, returns its name
    block_presence = (value) ->
      for key of hash_blocks
        if hash_blocks[key].toString() == value.toString()
          return key
      return false

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

      arr_classes[i][k] = key + 'b'

    for key of hash_homes
      i = hash_homes[key][0]
      k = hash_homes[key][1]

      if !block_presence([i, k])
        arr_classes[i][k] = key + 'h'
      else if block_presence([i, k]) == key
        arr_classes[i][k] = key + 'i'
      else
        arr_classes[i][k] = arr_classes[i][k] + key + 'h'

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

  map_array = fill_map(map_array)
  map_array[6][6] = 1
  hash_homes  = { 'r': [5, 8], 'g': [11, 3], 'b': [8, 3] }
  hash_blocks = { 'r': [5, 8], 'g': [11, 2], 'b': [1, 7], 'y': [8, 3], 't': [5, 2], 'v': [2, 3] }

  class_arr = convert(map_array, hash_blocks, hash_homes)
  console.log(class_arr)
  $(document).ready ->
    hey_ho_canvas(class_arr)
####################################################################################
####################################################################################
main()


