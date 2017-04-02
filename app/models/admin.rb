class Admin < ApplicationRecord
  has_many :pages

  validates :name, presence: true, length: { minimum: 2 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
