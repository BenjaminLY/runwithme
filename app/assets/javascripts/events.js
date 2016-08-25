$(document).ready(function() {
  $('[data-toggle="tooltip"]').tooltip();

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

  $(window).on("scroll", function(){
    if ( $(this).scrollTop() > 80 ){
       $(".navbar-wagon").css("background-color", "#222222");
    } else {
       $(".navbar-wagon").css("background-color", "transparent");
    }
  });
});
