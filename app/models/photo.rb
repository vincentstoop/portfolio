class Photo < ApplicationRecord
  belongs_to :page
  validates :title, length: { minimum: 2 }, allow_blank: true
  validates :description, length: { minimum: 5 }, allow_blank: true
  validate :image_presence
  validates_format_of :image, :with => /\.(png|jpg|jpeg)/, if: '!image.blank?'

  mount_uploader :image, ImageUploader

  private

    def image_presence
      if image.blank? && ( !title.blank? || !description.blank? )
        errors.add(:image, "must be present")
      end
    end
end
