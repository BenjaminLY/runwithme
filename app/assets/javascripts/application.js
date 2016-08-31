//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require momentjs
//= require bootstrap-sprockets
//= require bootstrap3-datetimepicker
//= require bootstrap-datepicker
//= require jquery-fileupload/basic
//= require chosen
//= require underscore
//= require gmaps/google
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require_tree .
//

$('a[href*="#"]:not([href="#"])').click(function() {
  if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
    var target = $(this.hash);
    target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
    if (target.length) {
      $('html, body').animate({
        scrollTop: target.offset().top
      }, 1000);
      return false;
    }
  }
});
