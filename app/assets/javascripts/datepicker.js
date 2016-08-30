function callDatePicker() {
  $('#datepicker').datepicker({
    autoclose: true,
    format: "dd/mm/yyyy",
    todayHighlight: true,
    language: "fr",
    daysOfWeekDisabled: "5,6",
    orientation: "auto",
    todayBtn: true,
    startDate: 'today'
  });
  //$('.datepicker').css('top', '285px');
}
