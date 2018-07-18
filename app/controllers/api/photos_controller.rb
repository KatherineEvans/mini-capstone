class Api::PhotosController < ApplicationController

  def index
    @photos = Photo.all

    render "index.json.jbuilder"
  end

  def create
    @photo = Photo.new(
      url: params["url"],
      product_id: params["product_id"]
      )
      
    if @photo.save
      render "show.json.jbuilder"
    else
      render json: {error: @photo.errors.full_messages}, status: 416
    end
  end

  def show
    @photo = Photo.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

end