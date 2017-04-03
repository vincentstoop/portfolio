class Photo < ApplicationRecord
  belongs_to :page
  validates :title, presence: true

  mount_uploader :image, ImageUploader
  validates_format_of :image, :with => /\.(png|jpg|jpeg)/, presence: true
end
