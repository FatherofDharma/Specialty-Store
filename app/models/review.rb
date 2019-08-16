class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :content_body, presence: true
  validates :content_body, length: {minimum: 50}
  validates :content_body, length: {maximum: 200}
  validates :rating, presence: true
  validates_numericality_of :rating, greater_than: 0
  validates_numericality_of :rating, less_than: 5
end
