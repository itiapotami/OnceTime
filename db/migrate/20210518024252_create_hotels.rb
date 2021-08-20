class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string       :hotel_name,       null: false
      t.text         :description,      null: false
      t.string       :country,          null:false
      t.string       :postal_code
      t.integer      :prefecture_id
      t.string       :city,             null: false
      t.string       :house_number,    null: false
      t.string       :building_number
      t.references   :owner,            foreign_key: true
      t.timestamps
    end
  end
end
