class ProductsController < ApplicationController
  
  def all_beers_for_sale
    @beers = Product.all
    render "all_beers_for_sale.json.jbuilder"
  end

  def ipa_beer_for_sale
    @beer = Product.first
    render "ipa_beer_for_sale.json.jbuilder"
  end

  def double_ipa_beer_for_sale
    @beer = Product.second
    render "double_ipa_beer_for_sale.json.jbuilder"
  end

  def red_ale_beer_for_sale
    @beer = Product.third
    render "red_ale_beer_for_sale.json.jbuilder"
  end

  def all_products_model
    output = params["id"]
    @beer = Product.find_by(id: output)
    render "all_products.json.jbuilder"
  end

end
