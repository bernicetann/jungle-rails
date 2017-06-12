class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniquesness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

end
