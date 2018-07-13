class CartedProductsController < ApplicationController

  def create
    @carted_product = CartedProduct.new(
      product_id: params["product_id"],
      quantity: params["quantity"],
      user_id: current_user.id 
    )
    if @carted_product.save
      render json: {message: "Your order saved!"}, status: :created
    else
      render json: {error: @carted_product.errors.full_messages}, status: 416
    end
  end

end
