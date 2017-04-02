class Photo < ApplicationRecord
  belongs_to :page

  mount_uploader :image, ImageUploader
end
