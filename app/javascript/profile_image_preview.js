window.addEventListener("turbo:load", function() {
  const fileInput = document.querySelector('input[type="file"]');
  const preview = document.querySelector('#image-preview');
  // 要素が読み込めない画面の場合はコンソールでエラーをはかないように防ぐ
  if (!fileInput || !preview) { return false; }

  fileInput.addEventListener('change', function() {
    const file = fileInput.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function(e) {
        preview.src = e.target.result;
      }
      reader.readAsDataURL(file);
    }
  });
});
