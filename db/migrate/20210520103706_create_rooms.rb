class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string       :room_name,        null: false
      t.string       :capacity,         null: false
      t.string       :price,            null: false
      t.references   :owner,      foreign_key: true
      t.references   :hotel,      foreign_key: true 
      t.timestamps
    end
  end
end
