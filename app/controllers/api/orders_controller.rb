class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jbuilder"
  end

  def create
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
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
    @carted_products.each do |carted_product|
      carted_product.status = "purchased"
      carted_product.order_id = @order.id
      carted_product.save
    end

    if @order.save
      render json: {message: "Order Saved"}
    else 
      render json: {message: "YOU SUCK"}
    end
  end

end
