class CreateConversation < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.timestamps
    end
    add_reference :conversations, :author, references: :users, index: true
    add_reference :conversations, :receiver, references: :users, index: true
  end
end
