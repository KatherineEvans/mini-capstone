class Product < ApplicationRecord
  validates :name, presence: true 
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0}
  validates :description, length: { in: 10..500}
  validates :supplier_id, presence: true

  has_many :orders
  has_many :type_products
  has_many :types, through: :type_products
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :users, through: :carted_products


  def is_discounted
    if price < 2
      return true
    else 
      return false
    end
  end

  def tax
    return price * 0.09
  end

  def total
    return price + tax
  end

  def supplier_info
    Supplier.find_by(id: supplier_id)
    #has many/belongs to relationship
  end

  def photo_info
    Photo.where(product_id: id)
  end
    
  def photo_url
    photo_info.map { |e| e["url"] }
  end

end