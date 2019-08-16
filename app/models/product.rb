class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  scope :three_most_recent, -> {order(created_at: :desc).limit(3)}

  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true

  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
    end
end
