class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all

    render "index.json.jbuilder"
  end

  def create
    
  end

  def show
  end

  def update
  end

  def destroy
  end

end
