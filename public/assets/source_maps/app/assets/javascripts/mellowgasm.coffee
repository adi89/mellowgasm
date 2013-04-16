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
    $('.top-bar-section').on('click', '.login', app.show_reg_form)
    $('body').on('keyup', '#searchinterview', app.filter_interviews)
    $('.submitAnswer').click(app.submit)
    # $('body').on('keyup', '#search', app.filter_interviews) ## add filter interviews
    $('body').on('token', '.stripe-button', app.token_generated)
    $('.passed').click(app.send_twilio)
    # $('.answer').click(hide_answer)
    $('.add_question').click(app.hide_question)
    # $('.create_question').click(show_question)
    $('body').on('click','.create_question', app.show_question)
    $('body').on('click', '.add_question', app.hide_question)
    $('body').on('click', '.choice', app.show_answer)
    $('body').on('click', '.answer', app.hide_answer)
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
  filter_interviews: (e) ->
    query = $('#searchinterview').val()
    if query.length == 0
      settings =
        dataType: 'script'
        type: 'get'
        url: '/interviews'
      $.ajax(settings)
    else
      settings =
        dataType: 'script'
        type: 'get'
        url: "/interviews/search?query=#{query}"
      $.ajax(settings)
  submit: (e) ->
    a = $(this).parent().children('input:checked')  #gets the array, c is answer ids
    interview_id = parseInt($('.q').first().attr('data-interview-id'))
    token = $('#show').data('auth-token')
    question_id = $(this).parent().attr('data-question-id')
    c = []
    progress_id = $('.progress').text()
    (a).each (idx, el) ->
      c.push $(this).attr("data-answer-id")
    settings =
      datatype: 'script'
      data: {authenticity_token: token, answer_ids: c, progress_id: progress_id, question_id: question_id, interview_id: interview_id }
      type: "post"
      url: "/progresses/#{interview_id}"
    $.ajax(settings)
  send_twilio: (e) ->
    console.log('you passed')
  hide_question: (e) ->
    console.log("hit")
    $('.add_question').hide()
  show_question: (e) ->
    $('.add_question').show()
  hide_answer: (e) ->
    $('.answer').hide()
  show_answer: (e) ->
    $('.answer').show()

$(document).ready(app.document_ready)
