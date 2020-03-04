class Guitar < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :records, dependent: :destroy

  validates :brand, presence: true, length: { maximum: 255 }
  validates :model, presence: true, length: { maximum: 255 }
end
