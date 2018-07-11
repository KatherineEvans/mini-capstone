class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @beers = Product.all
    search = params[:a]
    
    if search
      @beers = @beers.where("name ILIKE ? OR description ILIKE ?", "%#{search}%", "%#{search}%")
    end

    order_by_price = params[:b]
    if order_by_price == "price_list"
      @beers = @beers.order(:price => :desc)
    else
      @beers = @beers.order(:id)
    end

    render "index.json.jbuilder"
  end

  def create
    @beer = Product.new(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      supplier_id: params["supplier_id"]
      )
    if @beer.save
      render "show.json.jbuilder"
    else
      render json: {error: @beer.errors.full_messages}, status: 416
    end
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
    @beer.description = params[:description] || @beer.description
    
    if @beer.save
      render "show.json.jbuilder"
    else
      render json: {error: @beer.errors.full_messages}, status: 416
    end
  end

  def destroy
    @beer = Product.find_by(id: params[:id])
    @beer.destroy
    render json: {message: "This beer is no longer available"}
  end

end
