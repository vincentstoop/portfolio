class Page < ApplicationRecord
  belongs_to :admin
  has_many :photos

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true
    # validates :admin_id, presence: true
end
