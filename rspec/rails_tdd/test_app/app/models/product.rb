class Product < ApplicationRecord
  belongs_to :category

  validates :description, :price, :category, presence: true

  def full_description
    "#{self.description} - R$#{self.price}"
    # Produto 1 - R$1.20
  end
end
