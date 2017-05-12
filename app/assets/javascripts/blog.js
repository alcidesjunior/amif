
$(document).ready(function(){
  $("html").niceScroll();
  $('.parallax').parallax();
  var $doc = $('html, body');
  $('.anchor').click(function() {
    $doc.animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top
    }, 870);
    return false;
  });
});
