class Hotel < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :owner
  has_many   :rooms
  has_one_attached :image
end
