class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  with_options presence: true do
    validates :start_date
    validates :end_date
    validates :person
    validates :last_name
    validates :first_name
    validates :last_kana
    validates :first_kana
    validates :phone_number
    validates :room_id
    validates :user_id
  end
end
