class Type < ApplicationRecord
  has_many :type_products
  has_many :products, through: :type_products
end
