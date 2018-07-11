class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jbuilder"
  end

  def create
    @beer = Product.find_by(id: params[:product_id])
    @order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: @beer.price * params["quantity"].to_i,
      tax: @beer.tax * params["quantity"].to_i,
      total: @beer.total * params["quantity"].to_i
      )

    if @order.save
      render json: {message: "Order Saved"}
    else 
      render json: {message: "YOU SUCK"}
    end
  end

end
