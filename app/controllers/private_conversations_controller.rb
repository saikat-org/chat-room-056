class PrivateConversationsController < ApplicationController
  before_action :find_conversation!

  def new
    redirect_to conversation_path(@conversation) and return if @conversation
    @personal_message = current_user.private_conversations.build
  end

  def create
    @conversation ||= Conversation.create(author_id: current_user.id, receiver_id: @receiver.id)
    @personal_message = current_user.private_conversations.build(personal_message_params)
    @personal_message.conversation_id = @conversation.id
    @personal_message.save!
    ActionCable.server.broadcast notifying_channel, message_hash
    redirect_to conversation_path(@conversation)
  end

  private

  def notifying_channel
    notifying_person_id = (current_user.id == @conversation.author_id) ? @conversation.receiver_id : @conversation.author_id 
    "notifications_#{notifying_person_id}_channel"
  end

  def message_hash
    { message: emojify(@personal_message.body), 
      created_at: @personal_message.created_at, 
      email: current_user.email
    }
  end

  def personal_message_params
    params.require(:private_conversation).permit(:body)
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
