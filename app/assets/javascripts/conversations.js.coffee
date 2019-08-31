# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App.inbox = App.cable.subscriptions.create "notifications_" + gon.current_user_id + "_channel",
    received: (data) ->
      alert "Hello"
