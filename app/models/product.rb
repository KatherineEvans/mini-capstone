class Product < ApplicationRecord

  def is_discounted
    if price < 2
      return true
    else 
      false
    end
  end

  def tax
    return price * 0.09
  end

  def total
    return price + tax
  end

end
