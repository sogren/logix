ready = ->
  setTimeout (->
    $('.alert').fadeOut 'slow'
  ), 1500

$(document).ready ready
$(document).on 'page:load', ready
