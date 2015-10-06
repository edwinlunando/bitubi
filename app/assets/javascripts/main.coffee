ready = ->

  window.Site.init()

  province = $('#address_province')

  if province.length > 0
    province.change ->
      $.get(
        '/provinsi?id=' + this.value
      ).done (result) ->
        city = $('#address_city')
        city.html(result)
        return
      return

  city = $('#address_city')

  if city.length > 0
    city.change ->
      $.get(
        '/kota?id=' + this.value
      ).done (result) ->
        state = $('#address_state_id')
        state.html(result)
        return
      return

  # Bootstrap fix for dropdown (turbolinks)
  if $('.dropdown-toggle').length != 0
    $('.dropdown-toggle').click ->
      $(this).dropdown()
  if $('.selectize').length != 0
    $('.selectize').selectize()



$(document).on('ready page:load', ready)

Turbolinks.enableProgressBar()
