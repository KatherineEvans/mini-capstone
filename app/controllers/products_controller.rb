class ProductsController < ApplicationController

  def index
    @beers = Product.all
    @supplier = Supplier.find_by(id: "supplier_id")
    @photo = Photo.first
    render "index.html.erb"
  end

  def show
    @beer = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @beer = Product.new(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      supplier_id: params["supplier_id"],
      in_stock: params["in_stock"]
      )
    @beer.save
    redirect_to "/beers"
  end

end
