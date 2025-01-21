// turboによって二回ロードがされてしまうためフラグ制御する
let isPreviewImagesInitialized = false;

document.addEventListener("turbo:load", function() {
  function previewImages() {
    let preview = document.getElementById('image-preview');
    preview.innerHTML = '';
    preview.classList.add('bg-cyan-100', 'p-2', 'rounded-xl');
    let files = document.querySelector('input[type=file]').files;

    // 画像を一枚ずつプレビュー表示するように対策
    if(isPreviewImagesInitialized){
      isPreviewImagesInitialized = false;
      return;
    }

    // ファイルが選択されていればプレビュー処理
    if (files) {
      [].forEach.call(files, function(file) {
        let reader = new FileReader();
        reader.onload = function(event) {
          let img = document.createElement('img');
          img.src = event.target.result;
          img.classList.add('child-image-preview');
          img.classList.add('relative', 'overflow-hidden', 'rounded-xl', 'max-h-[10rem]');
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
  if (cachedImages) {
    let preview = document.getElementById('image-preview');
    preview.innerHTML = '';
    let images = cachedImages.split(',');
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
