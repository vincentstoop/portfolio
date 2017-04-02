class Page < ApplicationRecord
  belongs_to :admin
  has_many :photos

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true
  validates_format_of :image, :with => /\.(png|jpg|jpeg)/, allow_blank: true
  validates :admin_id, presence: true
end
