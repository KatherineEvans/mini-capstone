class Photo < ApplicationRecord

  def product
    Product.find_by(id: photo_id)
  end

end
