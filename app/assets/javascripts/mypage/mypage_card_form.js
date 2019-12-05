var $;
$(document).on("turbolinks:load", function() {
  var creditCardToolTip = $(
    ".mypage__card__form__security-code__about__tool-tip"
  );

  $(".mypage__card__form__security-code__about").click(function(e) {
    creditCardToolTip.toggle();
    e.stopPropagation();
  });

  $(".mypage").click(function() {
    creditCardToolTip.hide();
  });
});
