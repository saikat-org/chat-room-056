class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @conversation = Conversation.find_by(id: params[:id])
    @personal_message = PersonalMessage.new
  end
end

