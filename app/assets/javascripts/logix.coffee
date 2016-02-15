window.main = (hash_blocks, hash_homes, map_array) ->
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
      render(map_array, hash_blocks, hash_homes)
  #
  $(document).ready ->
    render(map_array, hash_blocks, hash_homes)
    lvl = 1
    $("#prevlvl").click ->
      if lvl > 1 then lvl-- else lvl = 13
      $("#levelbutton p").text "Level " + lvl
    $("#nextlvl").click ->
      if lvl < 13 then lvl++ else lvl = 1
      $("#levelbutton p").text "Level " + lvl
    $("#levelbutton").click ->
      level = $("#levelbutton p").text().match(/\d+/)[0]
      $.getScript '/levels/' + level
####################################################################################
####################################################################################
# parsing data from json to correct format
window.heh = (blocks, homes, map) ->
  valid_json = (some_json) ->
    return JSON.parse(some_json.replace(/&quot;/g,'"'))
  b = valid_json(blocks)
  h = valid_json(homes)
  m = valid_json(map)

  main(b, h, m)


$(document).ready ->
  lvl = 1
  $("#prevlvl").click ->
    if lvl > 1 then lvl-- else lvl = 13
    $("#levelbutton p").text "Level " + lvl
  $("#nextlvl").click ->
    if lvl < 13 then lvl++ else lvl = 1
    $("#levelbutton p").text "Level " + lvl
  $("#levelbutton").click ->
    level = $("#levelbutton p").text().match(/\d+/)[0]
    $.getScript '/levels/' + level
