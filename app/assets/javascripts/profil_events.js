$(document).ready(function() {

  $("#triangle_show").on("click", function(event) {
    if ( $(".events_to_show").hasClass("open") ) {
      $(".events_to_show").removeClass("open").slideUp(700);
    } else {
      $(".events_to_show").addClass("open").slideDown(1000);
    }
  });

  $("#triangle_participate").on("click", function(event) {
    if ( $(".events_where_participate").hasClass("open") ) {
      $(".events_where_participate").removeClass("open").slideUp(700);
    } else {
      $(".events_where_participate").addClass("open").slideDown(1000);
    }
  });

});
