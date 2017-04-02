class Page < ApplicationRecord
  has_many :photos
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true
  validates_format_of :image, :with => /\.(png|jpg|jpeg)/, allow_blank: true 
end
