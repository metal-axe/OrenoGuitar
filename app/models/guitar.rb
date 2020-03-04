class Guitar < ApplicationRecord
  belongs_to :user

  validates :brand, presence: true, length: { maximum: 255 }
  validates :model, presence: true, length: { maximum: 255 }
end
