window.main = (hash_blocks, hash_homes, map_array) ->
  #
  window.press = (e) ->
    switch e
      when "left"
        move(-1,0)
      when "up"
        move(0,-1)
      when "right"
        move(1,0)
      when "down"
        move(0,1)
    return
  #
  document.onkeydown = (e) ->
    console.log e.keyCode
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
    win_check = ->
      for key of hash_blocks
        if hash_blocks[key].toString() != hash_homes[key].toString()
          return false
      return true

    # recursively checks if block can move to neighbouring tile
    can_move = (r, c, x, y)->
      return false if map_array[r][c] == 'wl'
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
      if win_check() then alert("You won!")
  #
  $(document).ready ->
    render(map_array, hash_blocks, hash_homes)
####################################################################################
  window.solve = ->
    solve_level(map_array, hash_blocks, hash_homes)


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
  lvl_type = 0
  levels = ['Novice','Amateur','Advanced','Professional','Master']

  $("#easier").click ->
    if lvl_type > 0 then lvl_type-- else lvl_type = 4
    $("#typebutton").text levels[lvl_type]
  $("#harder").click ->
    if lvl_type < 4 then lvl_type++ else lvl_type = 0
    $("#typebutton").text levels[lvl_type]

  $("#prevlvl").click ->
    if lvl > 1 then lvl-- else lvl = 25
    $("#levelbutton").text "Level " + lvl
  $("#nextlvl").click ->
    if lvl < 25 then lvl++ else lvl = 1
    $("#levelbutton").text "Level " + lvl

  $("#levelbutton").click ->
    level = $("#levelbutton").text().match(/\d+/)[0]
    type  = $("#typebutton").text().match(/\w+/)[0]
    $.ajax {
      type: 'get',
      url: '/levels/' + level,
      data: { type: type }
    }
