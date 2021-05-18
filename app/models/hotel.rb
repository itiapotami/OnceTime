class Hotel < ApplicationRecord
  belongs_to :owner
  has_one_attached :image
end
