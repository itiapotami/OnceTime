class CreateRoomHaves < ActiveRecord::Migration[6.0]
  def change
    create_table :room_haves do |t|
      t.references    :room,       foreign_key: true
      t.references    :facility,   foreign_key: true
      t.timestamps
    end
  end
end
