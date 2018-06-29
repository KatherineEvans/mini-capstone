class ProductsController < ApplicationController
  
  def index
    @beers = Product.all
    render "index.json.jbuilder"
  end

  def create
    @beer = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"]
      )
    @beer.save
    render "show.json.jbuilder"
  end

  def show
    output = params["id"]
    @beer = Product.find_by(id: output)
    render "show.json.jbuilder"
  end

end
