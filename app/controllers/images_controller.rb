class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params[:image])
    if @image.save
      if params[:image][:asset_image].present?
        render :crop
      else
        redirect_to @image, notice: "Successfully created image."
      end
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(params[:image])
      if params[:image][:asset_image].present?
        render :crop
      else
        redirect_to @image, notice: "Successfully updated image."
      end
    else
      render :new
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_url, notice: "Successfully destroyed image."
  end
end
