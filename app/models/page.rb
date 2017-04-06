class Page < ApplicationRecord
  belongs_to :admin
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: :no_image

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true
    # validates :admin_id, presence: true

  private

    def no_image(attributes)
      attributes[:image].blank? && attributes[:title].blank? && attributes[:description].blank?
    end

end
