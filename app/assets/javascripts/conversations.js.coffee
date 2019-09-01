# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App.cable.subscriptions.create {
      channel: "NotificationsChannel"
      user_id: gon.current_user_id
    },
    received: (data) ->
      $('#conversation-body').append "<p>" + data.message + "</p>" + "<p> at <strong>" + data.created_at + "</strong><br>by <strong>" + data.email + "</strong></p>"

