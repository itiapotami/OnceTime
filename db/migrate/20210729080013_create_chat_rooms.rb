class CreateChatRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_rooms do |t|
      t.references :hotel, foreign_key: true
      t.timestamps
    end
  end
end
