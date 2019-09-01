App.cable.subscriptions.create {
      channel: "NotificationsChannel"
      user_id: gon.current_user_id
    },
    connected: ->
      # Called when subscription is connected
    disconnected: ->
      # Called when the subscription has been terminated by the server
    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
