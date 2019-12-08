var $;
$(document).on('turbolinks:load', function(){
  //カテゴリープルダウンのオプション作成
  function appendParentOption(category){
    var html = `<option value = "${category.name}" data-category = "${category.id}">${category.name}</option>`;
    return html;
  }
  //子カテゴリーのオプション作成
  function appendChildrenOption(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class = 'category__added' id = 'children_group'>
                            <div class = 'select-wrap'>
                              <select class='select-wrap__pulldown' id='child_category' name='category_id'>
                                <option value='---' data-category='---'>---</option>
                                ${insertHTML}
                              </select>
                            </div>
                          </div>`;
    $('.category-select').append(childSelectHtml);
  }
  //孫カテゴリーのオプション作成
  function appendGrandChildOption(insertHTML){
    var grandChildSelectHtml = '';
    grandChildSelectHtml = `<div class = 'category__added' id = 'grandChildren_group'>
                              <div class = 'select-wrap'>
                                <select class='select-wrap__pulldown' id='grandchild_category' name='category_id'>
                                  <option value='---' data-category='---'>---</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;
    $('.category-select').append(grandChildSelectHtml);
  }

  //親カテゴリ選択後のイベント
  $('#parent_category').on('change', function(){
    //選択された親カテゴリーの名前を取得
    var parentCategory = document.getElementById('parent_category').value;
    //親カテゴリが初期値出ないことを確認
    if (parentCategory != '---') {
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: {parent_name: parentCategory},
        dataType: 'json'
      })
      .done(function(children){
        //親カテゴリーが変更された場合は子カテゴリー以下を削除する
        $('#children_group').remove();
        $('#grandchildren_group').remove();
        $('#size_group').remove();
        $('#bland_group').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendParentOption(child);
        });
        appendChildrenOption(insertHTML);
      })
      .fail(function(){
        alert('カテゴリーの取得に失敗しました');
      })
    } else {
      $('#children_group').remove();
      $('#grandchildren_group').remove();
      $('#size_group').remove();
      $('#bland_group').remove();
    }
  });
  //子カテゴリー選択後のイベント
  $('.category-select').on('change','#child_category', function(){
    //選択された子カテゴリーのIDを取得
    var childId = $('#child_category option:selected').data('category');
    console.log(childId)
    //子カテゴリーが初期値ではない確認
    if (childId != "---"){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: {child_id: childId},
        dataType: 'json'
      })
      .done(function(grandchildren){
        //子カテゴリーが選択されたら以下を削除する
        $('#grandChildren_group').remove();
        $('#size_group').remove();
        $('#bland_group').remove();
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendParentOption(grandchild);
          console.log(insertHTML);
        });
        appendGrandChildOption(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    } else {
      $('#grandChildren_group').remove();
      $('#size_group').remove();
      $('#bland_group').remove();
    }
  });
});