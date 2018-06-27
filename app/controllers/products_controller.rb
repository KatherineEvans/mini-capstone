class ProductsController < ApplicationController
  def all_beers_for_sale
  
    @beers = Product.all
    render "all_beers_for_sale.json.jbuilder"
  end

end
