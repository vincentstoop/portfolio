class Doc < ApplicationRecord
  has_many :images
  belongs_to :admin

  accepts_nested_attributes_for :images, allow_destroy: true
end
