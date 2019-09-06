class PrivateConversation < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :conversation
  belongs_to :user
  has_one_attached :attachment

  def self.create(params, current_user, conversation)
    current_user.private_conversations.create!(params.merge({conversation: conversation}))
  end

  def notify(current_user)
    ActionCable.server.broadcast notifying_channel(current_user), message_hash(current_user)
  end

  def notifying_channel(current_user)
    notifying_person_id = (current_user.id == conversation.author_id) ? conversation.receiver_id : conversation.author_id 
    "notifications_#{notifying_person_id}_channel"
  end

  def message_hash(current_user)
    avatar_html = ""
    if current_user.avatar.attached?
      person = (user == current_user) ? "You" : user.full_name
      avatar_html = "<img src='" + rails_blob_path(current_user.avatar, only_path: true) + "' alt=" + person + " class='mr-3 mt-3 rounded-circle border border-dark' style='width:30px;'>"
    end

    attachment_html = ""
    if attachment.attached?
      attachment_html = "<div class='attachment'><image src='" + rails_blob_path(attachment, only_path: true) + "' style='width:80px;height:auto;'></div>"
    end

    { 
      message: Emojify::emojify(body),
      created_at: created_at.strftime("%F, %I:%M %p"),
      user: current_user.full_name,
      avatar: avatar_html,
      attachment: attachment_html
    }
  end

end
