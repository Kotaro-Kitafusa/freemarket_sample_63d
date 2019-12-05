var $;
$(document).on("turbolinks:load", function() {
  $("#todo-tab").click(function(e) {
    e.preventDefault();
    $("#todo-tab").addClass("active");
    $("#notice-tab").removeClass("active");
    $(".main__inner__body__notification__messages").hide();
    $(".main__inner__body__notification__alerts").show();
  });

  $("#notice-tab").click(function(e) {
    e.preventDefault();
    $("#todo-tab").removeClass("active");
    $("#notice-tab").addClass("active");
    $(".main__inner__body__notification__messages").show();
    $(".main__inner__body__notification__alerts").hide();
  });

  $("#current-transaction-tab").click(function(e) {
    e.preventDefault();
    $("#current-transaction-tab").addClass("active");
    $("#previous-transaction-tab").removeClass("active");
    $(".main__inner__body__purchase-history__content__previous").hide();
    $(".main__inner__body__purchase-history__content__current").show();
  });

  $("#previous-transaction-tab").click(function(e) {
    e.preventDefault();
    $("#current-transaction-tab").removeClass("active");
    $("#previous-transaction-tab").addClass("active");
    $(".main__inner__body__purchase-history__content__previous").show();
    $(".main__inner__body__purchase-history__content__current").hide();
  });
});
