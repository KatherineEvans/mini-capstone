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

end
