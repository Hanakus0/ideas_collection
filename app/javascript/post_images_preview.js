// turboによって二回ロードがされてしまうためフラグ制御する
let isPreviewImagesInitialized = false;

document.addEventListener("turbo:load", function() {
  function previewImages() {
    // HTML要素の取得
    let preview = document.getElementById('image-preview');
    preview.innerHTML = '';
    // スタイリング
    preview.classList.add('bg-cyan-100', 'p-2', 'rounded-xl');
    // 複数ファイルの取得
    let files = document.querySelector('input[type=file]').files;

    // 画像を一枚ずつプレビュー表示するように対策
    if(isPreviewImagesInitialized){
      isPreviewImagesInitialized = false;
      return;
    }

    // https://developer.mozilla.org/ja/docs/Web/API/FileReader/readAsDataURL
    // ファイルが選択されていればプレビュー処理
    if (files) {
      [].forEach.call(files, function(file) {
        let reader = new FileReader();
        // ファイルの読込が完了したら発火
        reader.onload = function(e) {
          // 親要素を生成
          let img = document.createElement('img');
          // ファイル取得
          img.src = e.target.result;
          // スタイリング
          img.classList.add('child-image-preview');
          img.classList.add('relative', 'overflow-hidden', 'rounded-xl', 'max-h-[10rem]');
          // 子要素に追加
          preview.appendChild(img);
        }
        reader.readAsDataURL(file);
      });
      // プレビューフラグ更新
      isPreviewImagesInitialized = true;
    }
  }

  // ページロード時にキャッシュされた画像をプレビュー表示
  let cachedImages = document.querySelector('input[name="post[images_cache]"]').value;
  // キャッシュがある場合
  if (cachedImages) {
    // 一旦要素を空にして画像表示
    let preview = document.getElementById('image-preview');
    preview.innerHTML = '';
    let images = cachedImages.split(',');
    // 一枚ずつ格納
    images.forEach(function(image) {
      let img = document.createElement('img');
      img.src = image;
      img.classList.add('child-image-preview');
      preview.appendChild(img);
    });
  }

  // ファイル選択時にプレビューを更新する
  document.querySelector('input[type=file]').addEventListener('change', previewImages);
});
