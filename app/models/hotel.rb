class Hotel < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :owner
  has_many   :rooms
  has_one_attached :image

  with_options presence: true do
    validates :hotel_name
    validates :description
    validates :postal_code,        format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,      numericality: { other_than: 1 }
    validates :city
    validates :house_number
  end
end
