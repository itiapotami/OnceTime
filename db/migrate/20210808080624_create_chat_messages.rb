class CreateChatMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_messages do |t|
      t.references :chat_room, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content
      t.timestamps
    end
  end
end
