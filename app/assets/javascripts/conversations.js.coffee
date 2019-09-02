# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App.cable.subscriptions.create {
      channel: "NotificationsChannel"
      user_id: gon.current_user_id
    },
    received: (data) ->
      $('#conversation-body').append  "<p>" + data.avatar + "<strong>" + data.user + " </strong>" + data.created_at + "</p><p>" + data.message + "</p>"
