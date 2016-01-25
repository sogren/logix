######################
# converts map array and homes hash to map of class names / used in displaying map
convert = (arr_blocks, hash_homes) ->
  # returns class names
  class_names = (value) ->
    switch value
      when 0 then return 'square'
      when 1 then return 'wall'
      else return 's' + value + 'b'

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
    i = parseInt(hash_homes[key].substr(0,2))
    k = parseInt(hash_homes[key].substr(2))
    block_name = arr_blocks[i][k]
    console.log(1)
    if block_name == 0 or block_name == 0
      arr_classes[i][k] = 's' + key + 'h'
    else if block_name == key
      arr_classes[i][k] = 's' + key + 'i'
    else
      arr_classes[i][k] = 's' + block_name + 'b'+ ' w' + key
  return arr_classes

######################

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

######################
main = ->
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
######################

  map_array = fill_map(map_array)

  hash_homes = { 'r': '0508', 'g': '1103','b': '0803' }

  map_array[5][8] = 'r'
  map_array[11][2] = 'g'
  map_array[1][7] = 'b'
  map_array[8][3] = 'y'
  map_array[5][2] = 't'
  map_array[2][3] = 'v'


  console.log(map_array)

  class_arr = convert(map_array, hash_homes)

  console.log(class_arr)

  $(document).ready ->
    create(class_arr)


#####################
main()
