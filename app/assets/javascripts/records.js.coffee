# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  # セレクトボックスでのページ遷移
  $('#location').click ->
    if $(this).val() != ''
      window.location.href = $('select[name=moveMonthPage]').val();