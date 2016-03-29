$ ->
  $('p.flash').fadeIn 800, ->
    setTimeout ->
      $('p.flash').fadeOut(1000)
    , 3000
