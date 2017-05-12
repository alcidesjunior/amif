
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
  var lastScrollTop = 0;
  $(window).scroll(function(event){
     var st = $(this).scrollTop();
     if (st > lastScrollTop){
         $('#upToHome').show();
     } else {
       $('#upToHome').hide();
     }
     lastScrollTop = st;
  });
  // $('.slider').carousel({fullWidth: true});
});
$(function(){ $('.slider').carousel({full_width: true}); });