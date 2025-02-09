// https://developer.mozilla.org/ja/docs/Web/API/FileReader/readAsDataURL
window.addEventListener("turbo:load", function() {
  // HTML要素の取得
  const fileInput = document.querySelector('input[type="file"]');
  const preview = document.querySelector('#image-preview');

  // 要素が読み込めない画面の場合はコンソールでエラーをはかないように防ぐ
  if (!fileInput || !preview) { return false; }

  // インプットを感知した歳の処理
  fileInput.addEventListener('change', function() {
    // 単体のファイルを取得
    const file = fileInput.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function(e) {
        // ファイルの内容をsrcへ格納
        preview.src = e.target.result;
      }
      reader.readAsDataURL(file);
    }
  });
});
