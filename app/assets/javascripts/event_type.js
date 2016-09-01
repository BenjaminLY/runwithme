function setEventType() {
  $('#event_private').val('false');
  $('#private-suite').hide()
  $('#private').click(function () {
    $(this).addClass('status_on');
    $('#public').removeClass('status_on');
    $('#event_private').val('true');
    $('#private-suite').show()
  });
  $('#public').click(function () {
    $(this).addClass('status_on');
    $('#private').removeClass('status_on');
    $('#event_private').val('false');
    $('#private-suite').hide()
  });
}
