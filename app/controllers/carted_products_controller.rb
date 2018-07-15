class CartedProductsController < ApplicationController

  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    render json: {message: "Yay!"}
  end

  def create
    @carted_product = CartedProduct.new(
      product_id: params["product_id"],
      quantity: params["quantity"],
      user_id: current_user.id,
      status: "carted"
    )
    if @carted_product.save
      render json: {message: "Your order saved!"}, status: :created
    else
      render json: {error: @carted_product.errors.full_messages}, status: 416
    end
  end

end
