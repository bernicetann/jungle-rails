class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :product, presence: true
  validates :user, presence: true
  validates :rating, presence: true
  validates_numericality_of :rating, :in => 0..5

end
