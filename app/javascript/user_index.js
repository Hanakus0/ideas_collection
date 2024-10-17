// users/index.html.erb
// ハンバーガーメニューの表示・非表示切り替え
document.getElementById('header_mb_menu_button').addEventListener('click', function(){
  // 要素を取得
  let element = document.getElementById('header_mb_menu');

  // displayプロパティを切り替える
  if (element.style.display === 'none') {
      element.style = '';
  } else {
      element.style.display = 'none';
  }
})

