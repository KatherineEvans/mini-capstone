class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jbuilder"
  end

  def create
    @carted_products = CartedProduct.where(status: "carted")
    @subtotal = 0

    @carted_products.each do |dex|
      @subtotal += (dex.product.price * dex.quantity)
    end

    @tax = @subtotal * 0.09
    @total = @subtotal + @tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: @subtotal,
      tax: @tax,
      total: @total
      )

    if @order.save
      render json: {message: "Order Saved"}
      
    else 
      render json: {message: "YOU SUCK"}
    end
  end

end
