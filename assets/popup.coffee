$ ->
  @url = ""
  @name = ""

  $("img.clickable").on "click", =>
    chrome.tabs.getSelected window.id, (tab) =>
      @url = tab.url
      #$(".url").text @url
      @path = @url.split(/https:\/\/github.com/)[1]
    #$(".status").text "crawling"
    $.get "https://github.com/notifications", (data) =>
      @name = $(data).find("#user-links .name").text()
      #$(".name").text @name

      $.ajax
        url: "http://codingstar.herokuapp.com/stars.json"
        type: "post"
        data:
          user: @name
          path: @path
      .done (data) =>
        console.log "success"
        #$(".status").text "done!"
      .always () =>
        $("img.clickable").attr("src", "images/icon128-ok.png")
        #$(".status").text "sending.."

