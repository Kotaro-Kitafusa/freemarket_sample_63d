var $;
//商品出品の利益計算
$(document).on('turbolinks:load', function(){
  $('.input-price').on('change', function(e){
    e.preventDefault()
    var registrate_price = $(this).val();
    console.log(registrate_price)

    //設定価格
    if (registrate_price >299 && registrate_price < 10000000) {
      var sale_fee = Math.floor(registrate_price * 0.1);
      var profits = (registrate_price - sale_fee);

      $('.commission').text('¥' + sale_fee.toLocaleString());
      $('.profits').text('¥' + profits.toLocaleString());
    } else {
      $('.commission').text('---');
      $('.profits').text('---');
    }
  });
});