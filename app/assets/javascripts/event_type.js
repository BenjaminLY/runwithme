function setEventType() {
  $('#event_private').val('false');
  $('.event_users').hide()
  $('#private').click(function () {
    $(this).addClass('status_on');
    $('#public').removeClass('status_on');
    $('#event_private').val('true');
    $('.event_users').show()
  });
  $('#public').click(function () {
    $(this).addClass('status_on');
    $('#private').removeClass('status_on');
    $('#event_private').val('false');
    $('.event_users').hide()
  });
}
