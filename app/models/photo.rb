class Photo < ApplicationRecord
  belongs_to :page
  validates :title, presence: true

  mount_uploader :image, ImageUploader
end
