class CreatePrivateConversation < ActiveRecord::Migration[5.2]
  def change
    create_table :private_conversations do |t|
      t.text :body
      t.belongs_to :conversation, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
