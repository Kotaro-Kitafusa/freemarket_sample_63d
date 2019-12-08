var $;

$(document).on('turbolinks:load', function(){

    function appendShippingOption(method){
      var html = `<option value='${method}'>${method}</option>`;
      return html
    }

  $('#shipping-method').on('change',function(e){
    e.preventDefault()
    var exhibitorShippingMethod = ['---', '未定','らくらくメルカリ便','ゆうメール','レターパック','普通郵便（定型、定型外）',
    'クロネコヤマト','ゆうパック','クリックポスト','ゆうパケット']
    var buyerShippingMethod = ['ゆうメール','クロネコヤマト','ゆうパック']

    var shippingParentCategory = ""

    shippingParentCategory = document.getElementById('shipping-method').value;
    if (shippingParentCategory !='---'){
      $.ajax({
        url:'/product/get_shipping_method',
        type:'GET',
        data: {parent_name: shippingParentCategory},
        dataType: 'json'
      })

      .done(function(method){
        var methodGroupHtml = '';
        var insertHTML = '';
        if (shippingParentCategory == "送料込み（出品者負担）"){
          exhibitorShippingMethod.forEach(function(method){
            insertHTML += appendShippingOption(method);
          });
        }else (shippingParentCategory == "着払い（購入者負担）");{
          buyerShippingMethod.forEach(function(method){
            insertHTML += appendShippingOption(method);
          });
        }

        methodGroupHtml = `<div class = 'form-group'>
                            <label>配達の方法
                              <span class =  'form-require'>必須</span>
                            </label>
                            <div class = 'select-wrap'>
                              <select class = 'select-wrap__pulldown'>
                                <option value = '---'>---</option>
                                ${insertHTML}
                              </select>
                              <ul class = 'has-error-text'>選択してください</ul>
                            </div>
                          </div>`;
      $('.way_of_shipping').append(methodGroupHtml);
        console.log(methodGroupHtml);

      })
    }
    else{
      $('#shipping-method').remove();
    }
  });
});
