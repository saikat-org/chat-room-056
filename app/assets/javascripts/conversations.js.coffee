# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App.cable.subscriptions.create {
      channel: "NotificationsChannel"
      user_id: gon.current_user_id
    },
  received: (data) ->
    if data.message != null
      message = "<p>" + data.message + "</p>"
    else
      message = ""
    $('#conversation-body').append "<div class='media border p-2'>" + data.avatar + "<div class='media-body'>" + "<h6>" + data.user + " <small><i>Posted on " + data.created_at + "</i></small></h6>" + message + data.attachment + '</div>' + '</div>'
