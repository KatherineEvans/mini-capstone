class ProductsController < ApplicationController
  
  def index
    @beers = Product.all
    render "index.json.jbuilder"
  end

  def show
    output = params["id"]
    @beer = Product.find_by(id: output)
    render "show.json.jbuilder"
  end

end
