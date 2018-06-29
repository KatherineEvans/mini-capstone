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
    @beer = Product.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @beer = Product.find_by(id: params[:id])
    @beer.name = params[:name] || @beer.name
    @beer.price = params[:price] || @beer.price
    @beer.image_url = params[:image_url] || @beer.image_url
    @beer.description = params[:description] || @beer.description
    @beer.save
    render "show.json.jbuilder"
  end

end
