var $;
$(document).on("turbolinks:load", function() {
  $(".product-detail__content__main__photo__thumbnails").slick({
    infinite: true, //スライドのループ有効化
    slidesToShow: 5, //表示するスライドの数
    focusOnSelect: true, //フォーカスの有効化
    asNavFor: ".product-detail__content__main__photo__slide-show"
    //thumbnailクラスのナビゲーション
  });

  $(".product-detail__content__main__photo__slide-show").slick({
    infinite: true,
    speed: 300,
    slidesToShow: 1
  });
});
