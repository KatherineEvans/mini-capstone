class Supplier < ApplicationRecord

  def products
    Product.where(supplier_id: id)
    #has many/belongs to relationship
  end

end
