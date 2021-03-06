// Generated by CoffeeScript 1.4.0
(function() {

  $(function() {
    var _this = this;
    this.url = "";
    this.name = "";
    return $("img.clickable").on("click", function() {
      chrome.tabs.getSelected(window.id, function(tab) {
        _this.url = tab.url;
        return _this.path = _this.url.split(/https:\/\/github.com/)[1];
      });
      return $.get("https://github.com/notifications", function(data) {
        _this.name = $(data).find("#user-links .name").text();
        return $.ajax({
          url: "http://codingstar.herokuapp.com/stars.json",
          type: "post",
          data: {
            user: _this.name,
            path: _this.path
          }
        }).done(function(data) {
          return console.log("success");
        }).always(function() {
          return $("img.clickable").attr("src", "images/icon128-ok.png");
        });
      });
    });
  });

}).call(this);
