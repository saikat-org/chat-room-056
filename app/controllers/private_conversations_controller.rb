class PrivateConversationsController < ApplicationController
  before_action :find_conversation!

  def new
    redirect_to conversation_path(@conversation) and return if @conversation
    @private_conversation = current_user.private_conversations.build
  end

  def create
    @conversation ||= Conversation.create(author_id: current_user.id, receiver_id: @receiver.id)
    @private_conversation = PrivateConversation.create(personal_message_params, current_user, @conversation)
    @private_conversation.notify(current_user)
    redirect_to conversation_path(@conversation)
  end

  private

  def personal_message_params
    params.require(:private_conversation).permit(:body, :attachment)
  end

  def find_conversation!
    if params[:receiver_id]
      @receiver = User.find_by(id: params[:receiver_id])
      redirect_to(root_path) and return unless @receiver
      @conversation = Conversation.between(current_user.id, @receiver.id)[0]
    else
      @conversation = Conversation.find_by(id: params[:conversation_id])
      redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
    end
  end
end
