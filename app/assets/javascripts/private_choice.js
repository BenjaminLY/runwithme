function setPrivateChoice() {
  $('#colleagues-choice').hide();
  $('#random-choice').hide();
  $('#colleagues').click(function () {
    $(this).addClass('private-choice');
    $('#random').removeClass('private-choice');
    $('#colleagues-choice').show();
    $('#random-choice').hide();
    $('#random-choice').empty();
  });
  $('#random').click(function () {
    $(this).addClass('private-choice');
    $('#colleagues').removeClass('private-choice');
    $('#colleagues-choice').hide();
    $('#random-choice').show();
  });
}
