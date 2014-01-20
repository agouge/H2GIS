$(document).ready(function() {
  searchStyle = $("style#search-style");

  $("input#search").on("keyup", function() {
    if (this.value === "") {
      searchStyle.html("");
    } else {
      searchStyle.html("article.post:not([data-index*=\"" + (this.value.toLowerCase().replace(/\\/g, "")) + "\"]) { display: none !important; }");
    }
  });
});
