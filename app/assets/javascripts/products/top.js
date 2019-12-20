var $;
$(document).on("turbolinks:load", function() {
  $('.top__fade').slick({
    autoplay: true,
    infinite: true,
    speed: 3000,
    fade: true,
  });
});