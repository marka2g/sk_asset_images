class TitlesController < ApplicationController
  def index
    @titles = Title.all
  end

  def show
    @title = Title.find(params[:id])
    @imageable = @title
    @images = @imageable.images
    @image = Image.new
  end

  def new
    @title = Title.new
    # @title.images.build
    # @title.image_types.new
  end

  def create
    @title = Title.new(params[:title])
    if @title.save
      redirect_to @title, notice: "Successfully created title."
      # if params[:title][:asset_image].present?
      #   render :crop
      # else
      #   redirect_to @title, notice: "Successfully created title."
      # end
    else
      render :new
    end
  end

  def edit
# binding.pry
    @title = Title.find(params[:id])
  end

  def update
# binding.pry
    @title = Title.find(params[:id])
    if @title.update_attributes(params[:title])
      redirect_to @title, notice: "Successfully updated the title."
      # if params[:title][:asset_image].present?
      #   render :crop
      # else
      #   redirect_to @title, notice: "Successfully updated title."
      # end
    else
      render :edit
    end
  end

  def destroy
    @title = Title.find(params[:id])
    @title.destroy
    redirect_to titles_url, notice: "Successfully destroyed the title."
  end
end
