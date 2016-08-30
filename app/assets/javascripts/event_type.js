function setEventType() {
  $('#private').click(function () {
    $(this).addClass('status_on');
    $('#public').removeClass('status_on');
    $('#event_private').val('true');
  });
  $('#public').click(function () {
    $(this).addClass('status_on');
    $('#private').removeClass('status_on');
    $('#event_private').val('false');
  });
}
