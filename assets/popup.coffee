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

    console.log "test"
    console.log @name
    console.log @url

    $.ajax
      url: "http://codingstar.herokuapp.com/stars.json"
      type: "post"
      data:
        user: @name
        url: @url
    .done (data) =>
      $(".status").text "done!"
    .always () =>
      $(".status").text "sending.."


#(
#  init: ->
#    self = this
#    $ ->
#      self.bindClick()
#      console.log "bindClick"
#
#  bindClick: ->
#    console.log "test"
#    self = this
#    $("button").on "click", ->
#
#  getOldestNotification: (callback) ->
#    chrome.extension.sendRequest
#      method: "popNotification"
#    , (res) ->
#      callback res
#
#  moveToUrl: (url) ->
#    chrome.tabs.getSelected null, (tab) ->
#      chrome.tabs.update tab.id,
#        url: url
#
#  setDescriptions: (notification) ->
#    $("#title").text notification.title
#    $("#icon").attr "src", notification.icon
#).init()
