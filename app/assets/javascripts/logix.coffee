# i need to find a way to make this efficient and short if possible
convert = (value) ->
  switch value
    when 0 then 'square'
    when 1 then 'wall'
    when 'r' then 'srb'
    when 'g' then 'sgb'
    when 'b' then 'sbb'
    when 'y' then 'syb'
    when 't' then 'stb'
    when 'v' then 'svb'
create = (arr) ->
  $('#container').empty()
  moves = 0
  $('#counter span').text moves
  r = 0
  while r < 13
    c = 0
    while c < 13
      $div = $('<div>', class: convert(arr[r][c]))
      $('#container').append $div
      c++
    r++

main = ->
######################
#  Make new array, fill with basic map values
  fill_map = (array) ->
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

  map_array = []
  map_array = fill_map(map_array)

  console.log(map_array)

  $(document).ready ->
    # create(map_array)


#####################
main()
