class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :content_body, presence: true
  validates :rating, presence: true
  validates_numericality_of :rating, greater_than: 0
  validates_numericality_of :rating, less_than: 5
end
