class PageController < ApplicationController
  def index
  end

  def broadcast
    ActionCable.server.broadcast 'web_notifications_channel', message: Emojify::emojify("#{params[:article][:body]}")
    return render nothing: true, status: 200
  end
end
