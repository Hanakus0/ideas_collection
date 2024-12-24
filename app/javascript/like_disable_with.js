window.addEventListener("turbolinks:load", function () {
  const links = document.querySelectorAll(".prevent-double-click");
  
  links.forEach(function (link) {
    link.addEventListener("click", function () {
      console.log("非活性化");
      this.classList.add("disabled");
    });
  });
});
