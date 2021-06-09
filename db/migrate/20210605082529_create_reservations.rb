class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date       :start_date,         null: false
      t.date       :end_date,           null: false
      t.string     :person,             null: false
      t.string     :last_name,          null: false
      t.string     :first_name,         null: false
      t.string     :last_kana,          null: false
      t.string     :first_kana,         null: false
      t.string     :phone_number,       null: false
      t.references :room,              foreign_key: true
      t.references :user,              foreign_key: true
      t.timestamps
    end
  end
end
