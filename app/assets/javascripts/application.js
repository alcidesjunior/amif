// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize
//= require_tree .

$(document).ready(function(){
  $('.logo').sideNav();
  $("html").niceScroll();
  $('.parallax').parallax();
  var $doc = $('html, body');
  $('a').click(function() {
    $doc.animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top
    }, 870);
    return false;
  });

  $('.carousel').carousel({padding: 200  });
  autoplay()
  function autoplay() {
      $('.carousel').carousel('next');
      setTimeout(autoplay, 2000);
  }
  $('input[type="tel"]').mask('(00)00000-0000');
  $(".dropdown-button").dropdown();
  $('select').material_select();
  $('.modal').modal({
      dismissible: false
    });
  $('ul.tabs').tabs();
  $('.submit_false').on('keyup keypress', function(e) {
    var keyCode = e.keyCode || e.which;
    if (keyCode === 13) {
      e.preventDefault();
      return false;
    }
  });
});
