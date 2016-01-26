main = ->
  dir = ''
  #
  document.onkeydown = (e) ->
    switch e.keyCode
      when 37
        dir = 'left'
        console.log(dir)
      when 38
        dir = 'up'
        console.log(dir)
      when 39
        dir = 'right'
        console.log(dir)
      when 40
        dir = 'down'
        console.log(dir)
    return
  #
  move = (x, y) ->
    switch dir
      when 'left'
    for block in block_hash
      r = block_hash[block][0]
      c = block_hash[block][1]

  # converts map array and homes hash to map of class names / used in displaying map
  convert = (arr_blocks, hash_blocks, hash_homes) ->
    # returns class names from block name
    class_names = (value) ->
      switch value
        when 0 then return 'square'
        when 1 then return 'wall'
        else return 's' + value + 'b'
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
    for key of hash_homes
      i = hash_homes[key][0]
      k = hash_homes[key][1]
      block_name = arr_blocks[i][k]
      if block_name == 0 or block_name == 0
        arr_classes[i][k] = 's' + key + 'h'
      else if block_name == key
        arr_classes[i][k] = 's' + key + 'i'
      else
        arr_classes[i][k] = 's' + block_name + 'b'+ ' w' + key
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

  hash_homes  = { 'r': [5, 8], 'g': [11, 3], 'b': [8, 3] }
  hash_blocks = { 'r': [5, 8], 'g': [11, 2], 'b': [1, 7], 'y': [8, 3], 't': [5, 2], 'v': [2, 3] }

  class_arr = convert(map_array, hash_blocks, hash_homes)

  $(document).ready ->
    create(class_arr)
#####################
main()


