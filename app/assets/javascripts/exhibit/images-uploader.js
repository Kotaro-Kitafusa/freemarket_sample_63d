var $;
$(document).on('turbolinks:load', function(){
  //以下で使うclass、idをわかりやすい名前に変更
  var doropzone = $('.sell-upload__drop-area');
  var doropzone2 = $('.sell-upload__drop-area2');
  var doropzone_box = $('.drop-box');
  var images = [];
  var inputs = [];
  var input_area = $('.input_area');
  var preview = $('#preview');
  var preview2 = $('#preview2');

  //ファイルを読み込んでプレビュー画面を作成
  $(document).on('change', 'input[type="file"].upload-image', function(event){
    var file = $(this).prop('files')[0];
    var render = new FileReader();
    inputs.push($(this));
    var img = $(`<div class = "img_view"><img></div>`);
    render.onload = function(e) {
      var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({
        src: e.target.result
      })
    }
    render.readAsDataURL(file);
    images.push(img);

    //画像が5枚以上かどうかによってドロップ可能なエリアを振り分ける
    if(images.length >= 5) {
      // 二段目のCSS
      doropzone2.css({
        'display':'block'
      })
      // 一段目のCSS
      doropzone.css({
        'display':'none'
      })
      //以下枚数により、画像の処理を分岐
      $.each(images, function(index, image){
        image.attr('data-image', index);
        preview2.append(image);
        doropzone2.css({
          'width' : `calc(100% - (135px * ${images.length - 5}))`
        })
      })
      if(images.length == 9){
        doropzone2.find('p').replaceWith('<i class = "fa fa-camera"></i>')
      }
    } else {
      $('#preview').empty();
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
      })
      doropzone.css({
        'width':`calc(100% - (135px * ${images.length}))`
      })
    }
    if(images.length == 4){
      doropzone.find('p').replaceWith('<i class = "fa fa-camera"></i>')
    }
    if(images == 10){
      doropzone2.css({
        'display':'none'
      })
      return;
    }
    var new_image = $(`<input multiple = "multiple" name = "product_images[image][]" class = "upload-image" data-image = ${images.length} type = "file" id = "upload-image">`);
    input_area.prepend(new_image);
  });
  $(document).on('click', '.delete', function(){
    var target_image = $(this).parent().parent();
    $.each(inputs, function(index, input){
      if($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove;
        var num = $(this).data('image');
        images.splice(num, 1);
        inputs.splice(num, 1);
        if(inputs.length == 0){
          $('input[type="file"].upload-image').attr({
            'data-image':0
          })
        }
      }
    })
    $('input[type="file"].upload-image:first').attr({
      'data-image':inputs.length
    })
    $.each(inputs, function(index, input){
      var input=$(this)
      input.attr({
        'data-image':index
      })
      $('input[type="file"].upload-image:first').after(input)
    })
    if(images.length >= 5){
      doropzone2.css({
        'display':'block'
      })
      $.each(images,function(index, image){
        image.attr('data-image', index);
        preview2.append(image);
      })
      doropzone2.css({
        'width':`calc(100% - (135px * ${image.length}))`
      })
      if(images.length == 9){
        doropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
      if(images.length == 8){
        doropzone2.find('p').replaceWith('<p>ココをクリックしてください</p>')
      }
    } else {
      doropzone.css({
        'display':'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
      })
      doropzone.css({
        'width':`calc(100% - (135px * ${images.length}))`
      })
    }
    if(images.length == 4){
      doropzone2.css({
        'display':'none'
      })
    }
    if(images.length == 3){
      doropzone.find('i').replaceWith('<p>ココをクリックしてください</p>')
    }
  })
})