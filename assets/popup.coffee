$ ->
  @url = ""
  @name = ""

  $("button").on "click", =>
    chrome.tabs.getSelected window.id, (tab) =>
      @url = tab.url
      $(".url").text @url
    $(".status").text "crawling"
    $.get "https://github.com/notifications", (data) =>
      @name = $(data).find("#user-links .name").text()
      $(".name").text @name


      $.ajax
        url: "http://codingstar.herokuapp.com/stars.json"
        type: "post"
        data:
          user: @name
          path: @url
      .done (data) =>
        $(".status").text "done!"
      .always () =>
        $(".status").text "sending.."

