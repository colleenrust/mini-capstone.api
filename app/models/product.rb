class Product < ApplicationRecord
  belongs_to :supplier
  # validates :name, presence: true
  # validates :name, uniqueness: true
  # validates :price, presence: true
  # validates :price, numericality: { greater_than: 0 }
  # validates :description, presence: true
  # validates :description, length: { in: 10..500 }
  def supplier
    Supplier.find_by(id: supplier_id)
  end
end
