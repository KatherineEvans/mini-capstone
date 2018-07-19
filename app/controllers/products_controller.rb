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

    @photo = Photo.new(
      url: params["url"],
      product_id: @beer.id
      )

    @photo.save

    redirect_to "/beers/#{@beer.id}"
  end

  def edit
    @beer = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @beer = Product.find_by(id: params[:id])
    @beer.name = params[:name] 
    @beer.price = params[:price]
    @beer.description = params[:description]
    @beer.supplier_id = params[:supplier_id]
    @beer.save
    redirect_to "/beers/#{@beer.id}"
  end

end
