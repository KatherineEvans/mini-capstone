class Supplier < ApplicationRecord

  def products_info
    Product.where(supplier_id: id)
    #has many/belongs to relationship
  end

end
