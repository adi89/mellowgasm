window.app =
  document_ready: ->
    $('#reg_form').on('click', 'a[data-clear-form]', app.clear_reg_form)
    $('#friend_form').on('click', 'a[data-clear-form]', app.clear_friend_form)
    $('.top-bar-section').on('click', '.login', app.show_reg_form)
    $('.submitAnswer').click(app.submit)
    $('.passed').click(app.send_twilio)
    $('body').on('click', '.fuck', app.close_modal)
    $('.landingmessage').hide()
    $('.landingmessage').fadeIn(1000)
    $('.landingmessagelogin').hide()
    $('.landingmessagelogin').fadeIn(6000)

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
    $('#venue_show').foundation('reveal', 'close')
    $('#TheLowDown').empty()
  give_morris: (data) ->
    console.log("hi")
    console.log(data)

    if data > 0
      Morris.Donut
        element: "donut-example"
        colors: ["#f7a0f7", "#b7e4f3"]
        data: [
          label: "Females"
          value: data
        ,
          label: "Males"
          value: 100 - data
        ]

$(document).ready(app.document_ready)


