# class Home
#   @document_ready: ->
#     $('#reg_form').on('click', 'a[data-clear-form]', Home.clear_reg_form)
#     $('.top-bar-section').on('click', '.login', Home.show_reg_form)
#     $('body').on('keyup', '#search', Home.filter_interviews)
#   @clear_reg_form: (e) ->
#     e.preventDefault()
#     $("#reg_form").hide()
#   @show_reg_form: (e) ->
#     e.preventDefault()
#     $("#reg_form").show()
#   @filter_interviews: (e) ->
#     query = $('#search').val()
#     settings =
#       dataType: 'script'
#       type: 'get'
#       url: "/interviews/search?query=#{query}"
#     $.ajax(settings)

window.app =
  document_ready: ->
    $('#reg_form').on('click', 'a[data-clear-form]', app.clear_reg_form)
    $('#friend_form').on('click', 'a[data-clear-form]', app.clear_friend_form)
    $('.top-bar-section').on('click', '.login', app.show_reg_form)
    $('.submitAnswer').click(app.submit)
    $('.passed').click(app.send_twilio)
    $('a.close-reveal-modal').trigger('click');
    $('body').on('click', '.fuck', app.close_modal)
  token_generated: (e, token) ->
    e.preventDefault()
    $(this).siblings('form').append("<input type=hidden name=token value=#{token.id}>").submit()
    console.log(token)
  clear_reg_form: (e) ->
    e.preventDefault()
    $("#reg_form").hide()
  show_reg_form: (e) ->
    e.preventDefault()
    $("#reg_form").show()
  clear_friend_form: (e) ->
    e.preventDefault()
    $("#friend_form").hide()
  show_friend_form: (e) ->
    e.preventDefault()
    $("#friend_form").show()
  close_modal: (e) ->
    e.preventDefault()
    $('#venue_show').foundation('reveal', 'close');
$(document).ready(app.document_ready)


